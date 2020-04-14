//
//  PodcastCell.swift
//  Podcasts-Review
//
//  Created by Chelsi Christmas on 12/18/19.
//  Copyright © 2019 Chelsi Christmas. All rights reserved.
//

import UIKit

class PodcastCell: UITableViewCell {
    
    var podcast: PodcastInfo?
    
    @IBOutlet weak var podcastImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    func configureCell(for podcast: PodcastInfo) {
        
        trackNameLabel.text = podcast.trackName
        artistNameLabel.text = podcast.artistName
        
        podcastImageView.getImage(with: podcast.artworkUrl600) { [weak self] (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.podcastImageView.image = UIImage(systemName: "sun.min")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.podcastImageView.image = image
                }
            }
        }
        
    }

}
