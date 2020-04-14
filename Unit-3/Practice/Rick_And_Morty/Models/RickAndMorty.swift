//
//  RickAndMorty.swift
//  Rick_And_Morty
//
//  Created by Chelsi Christmas on 1/10/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import Foundation


struct RickAndMorty: Codable {
    
    var results: [Results]
    
}

struct Results: Codable {
    var name: String
    var status: String
    var species: String
    var image: String

}
