//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Maksym Bondar on 11.11.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        let rotationDegrees = Angle.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5
                        let opacityValue = Double((geo.frame(in: .global).minY - 200) / (fullView.size.height / 2)).pretify
                        let scaleValue = Double(geo.frame(in: .global).midY / (fullView.size.height / 1.5)).scalePretify
                        let hueValue = Double(geo.frame(in: .global).midY / fullView.size.height)

                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color(hue: hueValue, saturation: 1.0, brightness: 1.0))
                            .rotation3DEffect(rotationDegrees, axis: (x: 0, y: 1, z: 0))
                            .scaleEffect(CGSize(width: scaleValue, height: scaleValue))
                            .opacity(opacityValue)
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

private extension Double {
    var pretify: Double {
        self > 1.0 ? 1.0 : (self < 0.0 ? 0.0 : self)
    }

    var scalePretify: Double {
        self > 1.0 ? 1.0 : self
    }
}

#Preview {
    ContentView()
}
