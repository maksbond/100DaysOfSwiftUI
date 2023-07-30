//
//  GameView.swift
//  Challenge3
//
//  Created by Maksym Bondar on 30.07.2023.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var game: Game

    var body: some View {
//        ForEach(questions) { question in
//            HStack(spacing: 8) {
//
//                if question.isPlayed {
//                    Text("\()")
//                        .font(.largeTitle)
//                        .frame(width: 50, height: 50)
//                        .clipShape(RoundedRectangle(cornerRadius: 4))
//                } else {
//                    TextField(value: question.userAnswer, format: .number, label: {
//                        <#code#>
//                    })
//                        .frame(width: 50, height: 50)
//                        .clipShape(RoundedRectangle(cornerRadius: 4))
//                }
//            }
//            .background(.clear)
//        }
        HStack {
            Spacer()

            Button(game.isLastStep ? "Finish" : "Apply") {
                
            }
            .buttonStyle(.bordered)

            Spacer()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    private static var game = Game()

    private static func startedGame() -> Game {
        game.startGame()
        return game
    }

    static var previews: some View {
        List {
            Section {
                GameView(game: startedGame())
            }
        }
    }
}
