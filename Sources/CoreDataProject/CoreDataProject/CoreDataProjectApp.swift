//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Maksym Bondar on 05.09.2023.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
