//
//  URL+VideoPreviewThumbnail.swift
//  AVFoundation-MediaFeed
//
//  Created by Chelsi Christmas on 4/13/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

extension URL {
    
    public func videoPreviewThumbnail() -> UIImage? {
        // create an AVAsset instance
        // e.g. mediaObject.videoURL
        // self refers to the instance of a url (videoURL)
        // e.g. let image = mediaObject.videoURL.videoPreviewThumbnail()
        let asset = AVAsset(url: self) // self is the URL instance
        
        // The AVAssetImageGenerator is an AVFoundation class taht converts a given media url to an image
        let assetGenerator = AVAssetImageGenerator(asset: asset)
        
        // we want to maintain the aspect ratio of the video
        assetGenerator.appliesPreferredTrackTransform = true
        
        // create a time stamp of needed location in the video
        // we will use a CMTime to generate the given time stamp
        // CMTime is part of Core Media
        let timeStamp = CMTime(seconds: 1, preferredTimescale: 60)
        // retrieve the time at the first second of the video
        
        var image: UIImage?
        
        do {
            // We're dealing with core graphics so we're getting back a Core Graphic
            let cgImage = try assetGenerator.copyCGImage(at: timeStamp, actualTime: nil)
            image = UIImage(cgImage: cgImage)
            
            // UIView
            // Layer
            // lower level API don't know about UIKit, AVKit
            // change the color of a UIView border
            // e.g someView.layer.borderColor = UIColor.green.cgColor
            
            
        } catch {
            print("Unable to retrieve media \(error)")
        }
        return image
    }
}
