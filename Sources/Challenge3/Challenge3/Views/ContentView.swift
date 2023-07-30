//
//  ContentView.swift
//  Challenge3
//
//  Created by Maksym Bondar on 30.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var game = Game()

    var body: some View {
        List {
            if !game.isGameStarted {
                Section("Game Settings") {
                    GameSettingsView(game: game)
                }
                .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            }

            if game.isGameStarted {
                Section {
                    GameView(game: game)
                }
            }
        }
        .alert("Well Done!", isPresented: $game.isGameCompleted) {
            Button("Restart", role: .destructive) {
                game.resetGame()
            }
        } message: {
            Text("Your score is \(game.score)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Game())
    }
}
