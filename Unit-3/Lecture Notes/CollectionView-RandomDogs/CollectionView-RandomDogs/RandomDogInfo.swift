//
//  RandomDogInfo.swift
//  CollectionView-RandomDogs
//
//  Created by Chelsi Christmas on 1/14/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import Foundation

typealias DogImage = String

struct RandomDogInfo: Decodable {
    let message: [DogImage]
}
