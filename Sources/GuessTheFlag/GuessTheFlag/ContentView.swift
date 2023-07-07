//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Maksym Bondar on 06.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
        Text("GuessTheFlag")
            .padding()
            .background(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
