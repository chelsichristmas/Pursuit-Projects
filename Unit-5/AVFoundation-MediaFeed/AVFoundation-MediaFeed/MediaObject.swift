//
//  MediaObject.swift
//  AVFoundation-MediaFeed
//
//  Created by Chelsi Christmas on 4/13/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import Foundation

// mediaObject instance can either be a video or an image content
struct MediaObject {
    let imageData: Data?
    let videoURL: URL?
    let caption: String? // UI so user can enter text
    let id = UUID().uuidString
    let createDate = Date()
    
}
