//
//  GameFactory.swift
//  Challenge3
//
//  Created by Maksym Bondar on 30.07.2023.
//

import Foundation

struct GameFactory {
    static func generateQuestions(for multiplier: Int, numberOfQuestions: Int) -> [Question] {
        ImageFactory.resetFactory()

        var questions = [Question]()
        let numbers = 1...10
        for id in 0..<numberOfQuestions {
            let question = numbers.randomElement() ?? 1
            questions.append(Question(id: id, number: question, multiplyBy: multiplier, correctAnswer: question * multiplier, animal: ImageFactory.randomUniqueAnimal()))
        }
        return questions
    }
}
