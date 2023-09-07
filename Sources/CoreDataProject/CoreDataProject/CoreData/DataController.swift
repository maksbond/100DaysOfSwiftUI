//
//  DataController.swift
//  CoreDataProject
//
//  Created by Maksym Bondar on 05.09.2023.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")

    init() {
        container.loadPersistentStores { description, error in
            if let error {
                print("Core data is failed to load: \(error.localizedDescription)")
            }
        }
    }
}
