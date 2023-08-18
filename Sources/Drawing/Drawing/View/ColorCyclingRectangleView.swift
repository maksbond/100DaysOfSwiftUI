//
//  ColorCyclingRectangleView.swift
//  Drawing
//
//  Created by Maksym Bondar on 18.08.2023.
//

import SwiftUI

struct ColorCyclingRectangleView: View {
    @State private var colorCycle = 0.0
    @State private var startX = 0.5
    @State private var startY = 0.0
    @State private var stopX = 0.5
    @State private var stopY = 1.0
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()

            VStack {
                ColorCyclingRectangle(amount: colorCycle, gradientStart: UnitPoint(x: startX, y: startY), gradientStop: UnitPoint(x: stopX, y: stopY))
                    .frame(width: 250, height: 250)
                    .drawingGroup()

                VStack {
                    Slider(value: $colorCycle)
                    Text("Gradient color")
                        .foregroundColor(.blue)
                }
                .padding()

                VStack {
                    Text("Start gradient position")
                        .foregroundColor(.blue)
                        .font(.headline)

                    Text("X")
                        .foregroundColor(.blue)
                        .font(.caption)
                    Slider(value: $startX)

                    Text("Y")
                        .foregroundColor(.blue)
                        .font(.caption)
                    Slider(value: $startY)
                }
                .padding()

                VStack {
                    Text("Stop gradient position")
                        .foregroundColor(.blue)
                        .font(.headline)

                    Text("X")
                        .foregroundColor(.blue)
                        .font(.caption)
                    Slider(value: $stopX)

                    Text("Y")
                        .foregroundColor(.blue)
                        .font(.caption)
                    Slider(value: $stopY)
                }
                .padding()
            }
        }

    }
}

struct ColorCyclingRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ColorCyclingRectangleView()
                .navigationTitle("Color Cycling Rectangle")
                .navigationBarTitleDisplayMode(.inline)
                .preferredColorScheme(.dark)
        }
    }
}
