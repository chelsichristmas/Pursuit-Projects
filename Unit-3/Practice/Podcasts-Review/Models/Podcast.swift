//
//  Podcast.swift
//  Podcasts-Review
//
//  Created by Chelsi Christmas on 12/18/19.
//  Copyright © 2019 Chelsi Christmas. All rights reserved.
//

import Foundation

struct Podcast: Codable {
    var results: [PodcastInfo]
}
struct PodcastInfo: Codable {
    var trackName: String
    var artistName: String
    var artworkUrl600: String
    
    // Maybe incorporate coding keys to change the name of artworkUrl600
    
}

