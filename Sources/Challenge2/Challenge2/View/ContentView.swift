//
//  ContentView.swift
//  Challenge2
//
//  Created by Maksym Bondar on 15.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var resetGame = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var gamesCounter = 0

    private let gameMoves = [Move.rock, .paper, .scissors]
    @State private var systemMove = Move.rock
    @State private var playerMove = Move.rock

    private let maxGamesCount = 10

    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: .blue, location: 0.5),
                .init(color: .yellow, location: 0.5)],
                           center: .top,
                           startRadius: 200,
                           endRadius: 700)
                .ignoresSafeArea()

            VStack {
                Spacer()

                VStack(spacing: 15) {
                    Text("Choose the move")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.secondary)

                    ForEach(gameMoves, id: \.name) { move in
                        Button {
                            moveTapped(move)
                        } label: {
                            GameMoveView(move: move)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))

                Text("Score: \(score)")
                    .font(.title.bold())
                    .foregroundColor(.primary)

                Spacer()
            }
            .padding()
        }
        .onAppear(perform: randomMove)
        .alert(scoreTitle, isPresented: $showingScore) {
            Button(resetGame ? "Reset" : "Continue",
                   role: resetGame ? .destructive : nil,
                   action: resetGame ? resetAction : randomMove)
        } message: {
            if resetGame {
                Text("Final score is \(score)")
            } else {
                Text("System picked: \(systemMove.name)\nYou picked: \(playerMove.name)")
            }
        }
    }

    func moveTapped(_ move: Move) {
        let result = Move.gameResult(with: move, against: systemMove)

        playerMove = move

        scoreTitle = result.name
        score += result.scoreAdjustment

        gamesCounter += 1
        showingScore = true
        resetGame = gamesCounter >= maxGamesCount
    }

    func randomMove() {
        systemMove = gameMoves.randomElement() ?? .rock
    }

    func resetAction() {
        score = 0
        randomMove()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
