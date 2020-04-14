//
//  PodcastAPIClient.swift
//  Podcasts-Review
//
//  Created by Chelsi Christmas on 12/18/19.
//  Copyright © 2019 Chelsi Christmas. All rights reserved.
//

import Foundation

struct PodcastAPIClient {
    
    static func getPodcasts(for searchQuery: String, completion: @escaping (Result<[PodcastInfo], AppError>) -> ()) {
        let searchQuery = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "love"
        
        let podcastEndpointURLString = "https://itunes.apple.com/search?media=podcast&limit=200&term=\(searchQuery)"
        
        guard let url = URL(string: podcastEndpointURLString) else {
            completion(.failure(.badURL(podcastEndpointURLString)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let searchResults = try JSONDecoder().decode(Podcast.self, from: data)
                    let podcasts = searchResults.results
                    completion(.success(podcasts))
                    
                } catch {
                    completion(.failure(.decodingError(error)))
                }
                
            }
        }
    }
    
    static func postFavorite(favoritePodcast: Podcast,completion: @escaping (Result<Bool,AppError>) ->()) {
        let favoritePodcastEndPoint = "https://5c2e2a592fffe80014bd6904.mockapi.io/api/v1/favorites"
        
        guard let url = URL(string: favoritePodcastEndPoint) else {
            return
        }
        
        do {
            let data = try JSONEncoder().encode(favoritePodcast)
            var request = URLRequest(url: url)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = data
            request.httpMethod = "POST"
            
            NetworkHelper.shared.performDataTask(with: request) { (result) in
                switch result {
                case .failure(let appError):
                    completion(.failure(.networkClientError(appError)))
                case .success:
                    completion(.success(true))
                }
            }
            
        } catch {
            completion(.failure(.encodingError(error)))
        }
    }
    
    
}

