//
//  GameResult.swift
//  Challenge2
//
//  Created by Maksym Bondar on 15.07.2023.
//

import Foundation

enum GameResult {
    case win, lose, draw

    var name: String {
        switch self {
        case .win:
            return "WIN 🏆"
        case .lose:
            return "LOSE 💩"
        case .draw:
            return "DRAW 🙀"
        }
    }

    var scoreAdjustment: Int {
        switch self {
        case .win:
            return 10
        case .lose:
            return -10
        case .draw:
            return 0
        }
    }
}
