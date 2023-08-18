//
//  ArrowShape.swift
//  Drawing
//
//  Created by Maksym Bondar on 18.08.2023.
//

import SwiftUI

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX / 2, y: rect.midY / 2))

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX * 1.5, y: rect.midY / 2))

        return path
    }
}
