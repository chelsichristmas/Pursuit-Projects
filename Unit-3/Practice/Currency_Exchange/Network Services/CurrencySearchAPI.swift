//
//  CurrencySearchAPI.swift
//  Currency_Exchange
//
//  Created by Chelsi Christmas on 1/6/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import Foundation


struct CurrencySearchAPI {
    
    
    static func fetchInfo(completion: @escaping (Result<[Currency],AppError>) -> ()) {
      
        let currencyEndpointURLString = "http://data.fixer.io/api/latest?access_key=\(Secrets.apiKey)"
      
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
            
            let currencyRates = try JSONDecoder().decode(Currency.self, from: data)
            
            
            
            completion(.success([currencyRates]))
            
          } catch {
            completion(.failure(.decodingError(error)))
          }
        }
      }
    }
    
    
}
