//
//  ColorCyclingRectangle.swift
//  Drawing
//
//  Created by Maksym Bondar on 18.08.2023.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100

    var gradientStart: UnitPoint
    var gradientStop: UnitPoint

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                                gradient: Gradient(colors: [
                                    color(for: value, brightness: 1),
                                    color(for: value, brightness: 0.5)
                                ]),
                                startPoint: gradientStart,
                                endPoint: gradientStop
                            ),
                        lineWidth: 2)
            }
        }
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}
