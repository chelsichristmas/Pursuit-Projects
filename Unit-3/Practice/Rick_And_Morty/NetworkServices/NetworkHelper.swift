//
//  NetworkHelper.swift
//  Rick_And_Morty
//
//  Created by Chelsi Christmas on 1/10/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import Foundation


class NetworkHelper {

  static let shared = NetworkHelper()
  
  private var session: URLSession
  

  private init() {
    session = URLSession(configuration: .default)
  }
  
  
  func performDataTask(with request: URLRequest,
                       completion: @escaping (Result<Data, AppError>) -> ()) {
  
    let dataTask = session.dataTask(with: request) { (data, response, error) in
      
   
      if let error = error {
        completion(.failure(.networkClientError(error)))
      }
      
        
      guard let urlResponse = response as? HTTPURLResponse else {
        completion(.failure(.noResponse))
        return
      }
      
      
      guard let data = data else {
        completion(.failure(.noData))
        return
      }
      
     
      switch urlResponse.statusCode {
      case 200...299: break
      default:
        completion(.failure(.badStatusCode(urlResponse.statusCode)))
        return
      }
      
     
      completion(.success(data))
    }
    dataTask.resume()
  }
}

