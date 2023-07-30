//
//  GameSettingsView.swift
//  Challenge3
//
//  Created by Maksym Bondar on 30.07.2023.
//

import SwiftUI

struct GameSettingsView: View {
    @ObservedObject var game: Game

    var body: some View {
        Stepper("Multiply value: \(game.practiceValue)", value: $game.practiceValue, in: 2...12, step: 1)

        Picker("Select number of questions", selection: $game.numberOfQuestions) {
            ForEach(game.questionVariants, id: \.self) {
                Text("\($0) questions")
            }
        }

        HStack {
            Spacer()

            Button("Start Game") {
                game.startGame()
            }
            .buttonStyle(.bordered)

            Spacer()
        }
        .padding(8)
    }
}

struct GameSettingsView_Previews: PreviewProvider {

    static var previews: some View {
        List {
            Section("Game Settings") {
                GameSettingsView(game: Game())
            }
        }
    }
}
