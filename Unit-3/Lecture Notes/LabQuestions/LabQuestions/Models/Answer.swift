//
//  Answer.swift
//  LabQuestions
//
//  Created by Chelsi Christmas on 12/16/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation


// an UPDATE is an HTTP method that would be able to parse your updates of an object
struct Answer: Decodable {
    var id: String
    var name: String
    var avatar: String
    var questionId: String
    var questionLabName: String
    var questionTitle: String
    var answerDescription: String
    var createdAt: String
}
