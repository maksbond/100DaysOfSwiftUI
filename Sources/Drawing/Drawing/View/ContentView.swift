//
//  ContentView.swift
//  Drawing
//
//  Created by Maksym Bondar on 13.08.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    ArrowView()
                } label: {
                    Text("Arror Shape")
                }
                NavigationLink {
                    ColorCyclingRectangleView()
                } label: {
                    Text("Color Cycling Rectangle")
                }
            }
            .navigationTitle("Day 45")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
