//
//  Question.swift
//  Challenge3
//
//  Created by Maksym Bondar on 30.07.2023.
//

import Foundation
import SwiftUI

struct Question: Identifiable {
    let id: Int
    let number: Int
    let multiplyBy: Int
    let correctAnswer: Int
    let animal: String
    var isPlayed: Bool = false
    var isCorrect: Bool = false
    var userAnswer: Int? = nil

    mutating func update(isPlayed: Bool) {
        self.isPlayed = isPlayed
    }

    mutating func update(userAnswer: Int) {
        self.userAnswer = userAnswer
    }

}
