//
//  ViewController.swift
//  AVFoundation-MediaFeed
//
//  Created by Chelsi Christmas on 4/13/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit
import AVFoundation // video playback is done one a CALayer
// all views are backed by a CA LAYER
//If we want to make a view rounded we can only do this using the  CA Layer of that view e.g someView.CALayer <- (?)
import AVKit // AVPlayerViewController lives here, video playback is done using the AVPlayerViewController

// Kit foundations tend to have more functionality

class MediaFeedViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var videoButton: UIBarButtonItem!
    @IBOutlet weak var photoLibraryButton: UIBarButtonItem!
    
    
    
    private lazy var imagePickerController: UIImagePickerController  = {
        let mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)
        let pickerContoller = UIImagePickerController()
        
        pickerContoller.mediaTypes = mediaTypes ?? ["kUTTypeImage"]
        pickerContoller.delegate = self
        return pickerContoller
    }()
    
    private var mediaObjects = [MediaObject]() {
        didSet { // property observer
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            videoButton.isEnabled = false
        }
    }
    
    
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    @IBAction func videoButtonPressed(_ sender: UIBarButtonItem) {
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true)
        
    }
    
    
    @IBAction func photoLibraryButtonPressed(_ sender: UIBarButtonItem) {
        
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true)
    }
    
    // utility function right under photo library button pressed action
    private func playRandomVideo(in view: UIView) {
        // we want all non nil media objects from the media objects array
        // mediaObjects array
        // we use compact map because it returns all non-nil values
        
        let videoURLs = mediaObjects.compactMap { $0.videoURL }
        
        
        // we’re unwrapping this way because the array of videoURLs are all optional
        // even though the compactMap removes all of the nil values, you still need to ensure you’re properly unwrapping to avoid bugs/crahes
        if let videoURL = videoURLs.randomElement() {
            let player = AVPlayer(url: videoURL)
            
            // create a sublayer
            let playerLayer = AVPlayerLayer(player: player)
            // set its frame
            playerLayer.frame = view.bounds // take up the entire headerVIew
            
            // set video aspect ratio
            playerLayer.videoGravity = .resizeAspect
            
            // remove all sublayers from the headerView
            view.layer.sublayers?.removeAll()
            
            // add the playerLayer to the headerView’s layer
            view.layer.addSublayer(playerLayer)
            
            // play video
            player.play()
        }
        
    }
}
// MARK: UICollection View DataSource Methods
extension MediaFeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        mediaObjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mediaCell", for: indexPath) as? MediaCell else {
            fatalError("Could not dequeue a MediaCell")
        }
        
        let mediaObject = mediaObjects[indexPath.row]
        cell.configureCell(for: mediaObject)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // this is also a dequeable view
        
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView", for: indexPath) as? HeaderView else {
            fatalError("could not dequeue a HeaderView")
        }
        playRandomVideo(in: headerView)
        return headerView
    }
}
// MARK: UICollection View Delegate Methods
extension MediaFeedViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mediaObject = mediaObjects[indexPath.row]
        let playerViewController = AVPlayerViewController()
        guard let videoURL = mediaObject.videoURL else {
            return
        }
        let player = AVPlayer(url: videoURL)
        playerViewController.player = player
        present(playerViewController, animated: true) {
            // play video automatically
            
        
            player.play()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size // max width and height of device
        let itemWidth: CGFloat = maxSize.width
        let itemHeight: CGFloat = maxSize.height * 0.40 // 40% of the height of the device
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height * 0.30)
    }
}


extension MediaFeedViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        // info dictionary keys
        // InfoKey.originalImage - UIImage
        // InfoKey.mediaType - String
        guard let mediaType = info[UIImagePickerController.InfoKey.mediaType] as? String else {
            return
        }
        
        switch mediaType { // "public.movie" , "public.image"
        case "public.image":
            if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
                let imageData = originalImage.jpegData(compressionQuality: 1.0) {
                let mediaObject = MediaObject(imageData: imageData,
                                              videoURL: nil, caption: nil)
                mediaObjects.append(mediaObject) // 0 => 1
            }
            
        case "public.movie":
            if let mediaURL = info[UIImagePickerController.InfoKey.mediaURL] as? URL {
                print("mediaURL: \(mediaURL)")
                let mediaObject = MediaObject(imageData: nil, videoURL: mediaURL, caption: nil)
                mediaObjects.append(mediaObject)
            }
            
        default:
            print("unsupported media type")
        }
        
        print("mediaType: \(mediaType)") // "public.movie", "public.image"
        
        picker.dismiss(animated: true)
    }
}


