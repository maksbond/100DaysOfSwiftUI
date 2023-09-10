//
//  DataController.swift
//  Challenge5
//
//  Created by Maksym Bondar on 10.09.2023.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Challenge5")

    init() {
        container.loadPersistentStores { [weak self] description, error in
            if let error {
                print("Core data is failed to load: \(error.localizedDescription)")
            }

            guard let self else { return }
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
