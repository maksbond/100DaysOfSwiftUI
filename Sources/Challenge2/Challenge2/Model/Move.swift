//
//  Move.swift
//  Challenge2
//
//  Created by Maksym Bondar on 15.07.2023.
//

import SwiftUI

enum Move {
    case rock, paper, scissors

    var icon: Text {
        switch self {
        case .rock:
            return Text("🪨")
        case .paper:
            return Text("🧻")
        case .scissors:
            return Text("✂️")
        }
    }

    var name: String {
        switch self {
        case .rock:
            return "ROCK"
        case .paper:
            return "PAPER"
        case .scissors:
            return "SCISSORS"
        }
    }

    static func gameResult(with playerMove: Move, against systemMove: Move) -> GameResult {
        switch (playerMove, systemMove) {
        case (.rock, .rock):
            return .draw
        case (.rock, .paper):
            return .lose
        case (.rock, .scissors):
            return .win
        case (.paper, .paper):
            return .draw
        case (.paper, .rock):
            return .win
        case (.paper, .scissors):
            return .lose
        case (.scissors, .scissors):
            return .draw
        case (.scissors, .paper):
            return .win
        case (.scissors, .rock):
            return .lose
        }
    }
}
