//
//  MediaCell.swift
//  AVFoundation-MediaFeed
//
//  Created by Chelsi Christmas on 4/13/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class MediaCell: UICollectionViewCell {
    
    @IBOutlet weak var mediaImageView: UIImageView!
    
    public func configureCell(for mediaObject: MediaObject) {
        if let imageData = mediaObject.imageData {
            // converts a data image into a UIImage
            mediaImageView.image = UIImage(data: imageData)
        }
        // MARK: Create a video preview thumbnail
        if let videoURL = mediaObject.videoURL {
            let image = videoURL.videoPreviewThumbnail() ?? UIImage(systemName: "heart")
            mediaImageView.image = image
        }
    }
}
