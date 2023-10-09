//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Maksym Bondar on 06.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var resetGame = false
    @State private var scoreTitle = ""
    @State private var selectedCountry = ""
    @State private var score = 0
    @State private var gamesCounter = 0

    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "US"].shuffled()
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    @State private var correctAnswer = Int.random(in: 0...2)

    // animations
    @State private var tappedFlag: Int?
    @State private var isFadeOut = false

    private let maxGamesCount = 8

    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: .init(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: .init(red: 0.76, green: 0.15, blue: 0.26), location: 0.5)],
                           center: .top,
                           startRadius: 200,
                           endRadius: 700)
                .ignoresSafeArea()

            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.black))
                    }

                    ForEach(0..<3) { flag in
                        Button {
                            flagTapped(flag)
                        } label: {
                            FlagImage(flagName: countries[flag])
                                .rotation3DEffect(Angle(degrees: tappedFlag == flag ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                                .opacity(isFadeOut && tappedFlag != flag ? 0.25 : 1.0)
                                .scaleEffect(isFadeOut && tappedFlag != flag ? CGSize(width: 0.95, height: 0.95) : CGSize(width: 1, height: 1))
                                .accessibilityLabel(labels[countries[flag], default: "Unknown flag"])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))

                Spacer()
                Spacer()

                Text("Score: \(score)")
                    .font(.title.bold())
                    .foregroundColor(.white)

                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button(resetGame ? "Reset" : "Continue",
                   role: resetGame ? .destructive : nil,
                   action: resetGame ? resetAction : askQuestion)
        } message: {
            Text("\(selectedCountry.isEmpty ? "" : "That's the flag of \(selectedCountry)!\n")Your score is \(score)!\(resetGame ? "\nNow is time to reset game!" : "")")
        }
    }

    func flagTapped(_ flag: Int) {
        withAnimation {
            tappedFlag = flag
        }
        withAnimation(.interpolatingSpring(stiffness: 25, damping: 5)) {
            isFadeOut.toggle()
        }
        gamesCounter += 1
        if flag == correctAnswer {
            scoreTitle = "Correct!"
            score += 1
            selectedCountry = ""
        } else {
            scoreTitle = "Wrong!"
            selectedCountry = countries[flag]
        }

        showingScore = true
        resetGame = gamesCounter >= maxGamesCount
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        tappedFlag = nil
        withAnimation(.easeOut(duration: 0.25)) {
            isFadeOut.toggle()
        }
    }

    func resetAction() {
        score = 0
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
