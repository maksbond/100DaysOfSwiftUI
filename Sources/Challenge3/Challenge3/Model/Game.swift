//
//  Game.swift
//  Challenge3
//
//  Created by Maksym Bondar on 30.07.2023.
//

import SwiftUI

class Game: ObservableObject {
    @Published var currentQuestion = 1
    @Published var practiceValue = 2
    @Published var numberOfQuestions = 5
    @Published var questions = [Question]()

    @Published var isGameStarted = false
    @Published var isLastStep = false
    @Published var isGameCompleted = false

    var score: Int {
        var score = 0
        questions.forEach {
            if $0.isCorrect {
                score += 1
            }
        }
        return score
    }

    let questionVariants = [5, 10, 20]

    func startGame() {
        questions = GameFactory.generateQuestions(for: practiceValue, numberOfQuestions: numberOfQuestions)

        withAnimation {
            isGameStarted = true
        }
    }

    func next() {
        if isLastStep {
            isGameCompleted = true
        } else {
            
        }
    }

    func resetGame() {
        isGameCompleted = false
        withAnimation {
            isGameStarted = false
        }
    }
}
