//
//  AppError.swift
//  Currency_Exchange
//
//  Created by Chelsi Christmas on 1/6/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import Foundation

enum AppError: Error {
  case badURL(String) // associated value
  case noResponse
  case networkClientError(Error) // no internet connection
  case noData
  case decodingError(Error)
  case badStatusCode(Int) // 404, 500
  case badMimeType(String) // image/jpg
}
