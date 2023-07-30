//
//  GameRow.swift
//  Challenge3
//
//  Created by Maksym Bondar on 30.07.2023.
//

import SwiftUI

struct GameRow: View {
    @Binding var question: Question

    var body: some View {
        HStack(spacing: 4) {
            CardView(text: "\(question.number)")

            CardView(text: "X")

            CardView(text: "\(question.multiplyBy)")

            Text("=")
                .font(.largeTitle)

            FlippingCard(isPlayed: $question.isPlayed, userInput: $question.userAnswer, isCorrect: $question.isCorrect, imageName: question.animal)
        }
    }
}

struct GameRow_Previews: PreviewProvider {
    @State static private var question = Question(id: 0, number: 1, multiplyBy: 2, correctAnswer: 2, animal: "zebra")

    static var previews: some View {
        GameRow(question: $question)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
