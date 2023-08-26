//
//  DataController.swift
//  Bookworm
//
//  Created by Maksym Bondar on 26.08.2023.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")

    init() {
        container.loadPersistentStores { description, error in
            if let error {
                print("Core data is failed to load: \(error.localizedDescription)")
            }
        }
    }
}
