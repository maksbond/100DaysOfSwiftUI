//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Maksym Bondar on 06.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0

    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

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
                            Image(countries[flag])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(color: .blue, radius: 5)
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
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }

    func flagTapped(_ flag: Int) {
        if flag == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
        }

        showingScore = true
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
