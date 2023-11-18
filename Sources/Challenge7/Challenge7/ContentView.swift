//
//  ContentView.swift
//  Challenge7
//
//  Created by Maksym Bondar on 18.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDice = Dice.ten
    @State private var randomValue = 0

    @State private var isSelectingDiceType = false

    @State private var isActive = false

    private let defaultNumberOfRetries = 10
    @State private var randomTimes = 0

    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationStack {
            VStack {
                Text("Shape")
                    .font(.title)

                Text("\(selectedDice.name)-sides dice")
                    .font(.caption)

                Text("\(randomValue)")
                    .frame(width: 150, height: 150)
                    .font(.largeTitle)
                    .foregroundStyle(.blue)
                    .overlay {
                        switch selectedDice.figure {
                        case .triangle:
                            Triangle()
                                .stroke(.blue, lineWidth: 4)
                        case .rectangle:
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.blue, lineWidth: 4)
                        case .diamond:
                            Diamond()
                                .stroke(.blue, lineWidth: 4)
                        case .pentagon:
                            Polygon()
                                .stroke(.blue, lineWidth: 4)
                        }
                    }
                    .contentShape(RoundedRectangle(cornerRadius: 16))
            }
            .onAppear(perform: {
                randomValue = selectedDice.selectRandom()
                randomTimes = defaultNumberOfRetries
            })
            .onTapGesture {
                isActive = true
            }
            .onReceive(timer) { time in
                guard isActive else { return }

                if randomTimes > 0 {
                    randomTimes -= 1
                    randomValue = selectedDice.selectRandom()
                } else {
                    isActive = false
                    randomTimes = defaultNumberOfRetries
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Dice type") {
                        isSelectingDiceType = true
                    }
                }
            })
            .onChange(of: selectedDice, { _, _ in
                randomValue = selectedDice.selectRandom()
            })
            .sensoryFeedback(.success, trigger: isActive)
            .sheet(isPresented: $isSelectingDiceType, content: {
                DicePickView(selectedDice: $selectedDice)
            })
            .navigationTitle("Dice machine")
        }
    }
}

#Preview {
    ContentView()
}
