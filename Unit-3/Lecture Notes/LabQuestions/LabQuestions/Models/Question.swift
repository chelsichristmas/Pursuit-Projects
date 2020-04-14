//
//  Questions.swift
//  LabQuestions
//
//  Created by Chelsi Christmas on 12/12/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct Question: Codable {
    let id: String
    let createdAt: String // creating a date name
    let name: String // rnadom user name
    let avatar: String // random user avatar
    let title: String
    let description: String
    let labName: String
}
