//
//  RickAndMortyAPIClient.swift
//  Rick_And_Morty
//
//  Created by Chelsi Christmas on 1/10/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import Foundation


struct CurrencySearchAPI {
    
    
    static func fetchInfo(completion: @escaping (Result<[Results],AppError>) -> ()) {
      
        let currencyEndpointURLString = "https://rickandmortyapi.com/api/character"
      
      guard let url = URL(string: currencyEndpointURLString) else {
        completion(.failure(.badURL(currencyEndpointURLString)))
        return
      }
      
      
      
      let request = URLRequest(url: url)
     
      
      NetworkHelper.shared.performDataTask(with: request) { (result) in
        switch result {
        case .failure(let appError):
          completion(.failure(.networkClientError(appError)))
        case .success(let data):
          do {
            
            let characters = try JSONDecoder().decode(RickAndMorty.self, from: data)
            
            
            
            completion(.success(characters.results))
            
          } catch {
            completion(.failure(.decodingError(error)))
          }
        }
      }
    }
    
    
}
