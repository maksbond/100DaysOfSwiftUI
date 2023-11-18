//
//  DicePickView.swift
//  Challenge7
//
//  Created by Maksym Bondar on 18.11.2023.
//

import SwiftUI

struct DicePickView: View {
    private let dices = Dice.allCases
    @Binding var selectedDice: Dice
    @Environment(\.dismiss) var dismiss

    var body: some View {
        List {
            ForEach(dices, id: \.name) { dice in
                HStack {
                    Text("\(dice.name)-sides dice")
                    Spacer()
                    if dice == selectedDice {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.green)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedDice = dice
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    DicePickView(selectedDice: .constant(.six))
}
