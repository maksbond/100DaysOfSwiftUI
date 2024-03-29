//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Maksym Bondar on 21.11.2023.
//

import SwiftUI

class Favorites: ObservableObject {
    // the actual resorts the user has favorited
    private var resorts: Set<String>

    // the key we're using to read/write in UserDefaults
    private let saveKey = "Favorites"

    init() {
        guard let data = UserDefaults.standard.data(forKey: saveKey) else {
            resorts = []
            return
        }
        resorts = (try? JSONDecoder().decode(Set<String>.self, from: data)) ?? []
    }

    // returns true if our set contains this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }

    // adds the resort to our set, updates all views, and saves the change
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }

    // removes the resort from our set, updates all views, and saves the change
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }

    func save() {
        guard let data = try? JSONEncoder().encode(resorts) else {
            fatalError("Can't encode data")
        }

        UserDefaults.standard.set(data, forKey: saveKey)
    }
}
