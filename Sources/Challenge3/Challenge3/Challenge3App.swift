//
//  Challenge3App.swift
//  Challenge3
//
//  Created by Maksym Bondar on 30.07.2023.
//

import SwiftUI

@main
struct Challenge3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Game())
        }
    }
}
