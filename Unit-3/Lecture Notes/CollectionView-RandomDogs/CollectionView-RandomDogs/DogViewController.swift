//
//  DogViewController.swift
//  CollectionView-RandomDogs
//
//  Created by Chelsi Christmas on 1/14/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

// NB: as of iOS 13  collection view cells are self-resizing by default
// in order to not self-resize we have to set "estimated size" from Automatic to none in the size inspector for the collection view

class DogViewController: UIViewController {
    
    private var dogImages = [DogImage]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .green
        fetchDogImages()

        
    }
    

    private func fetchDogImages() {
        DogAPIClient.fetchDogs { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("could not fetch dog images with error: \(appError)")
            case .success(let dogImages):
                self?.dogImages = dogImages
            }
        }
    }
    
}

extension DogViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dogCell", for: indexPath) as? DogCell else  {
            fatalError("Could not downcast to DogCell")
        }
        
        let dogImage = dogImages[indexPath.row]
        cell.configureCell(with: dogImage)
        return cell
    }
}

extension DogViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing: CGFloat = 10 // space between items
        let maxWidth = UIScreen.main.bounds.size.width // device's width
        let numberOfItems: CGFloat = 3 // items
        let totalSpacing: CGFloat = numberOfItems * interItemSpacing
        let itemWidth: CGFloat = (maxWidth - totalSpacing) / numberOfItems
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        // by default this value is 10
        return 3
    }
}

