//
//  ContentView.swift
//  BetterRest
//
//  Created by Maksym Bondar on 16.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now

    var body: some View {
        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
