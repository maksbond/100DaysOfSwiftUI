//
//  Dice.swift
//  Challenge7
//
//  Created by Maksym Bondar on 18.11.2023.
//

import SwiftUI

enum Figure {
    case triangle, rectangle, diamond, pentagon
}

enum Dice: CaseIterable {
    case four, six, eight, ten, twelwe, twenty

    var figure: Figure {
        switch self {
        case .four, .eight, .twenty:
            return .triangle
        case .six:
            return .rectangle
        case .ten:
            return .diamond
        case .twelwe:
            return .pentagon
        }
    }

    var name: String {
        switch self {
        case .four:
            return "4"
        case .six:
            return "6"
        case .eight:
            return "8"
        case .ten:
            return "10"
        case .twelwe:
            return "12"
        case .twenty:
            return "20"
        }
    }

    func selectRandom() -> Int {
        .random(in: 1...number)
    }

    private var number: Int {
        switch self {
        case .four:
            return 4
        case .six:
            return 6
        case .eight:
            return 8
        case .ten:
            return 10
        case .twelwe:
            return 12
        case .twenty:
            return 20
        }
    }
}
