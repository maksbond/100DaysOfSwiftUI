//
//  ImageFactory.swift
//  Challenge3
//
//  Created by Maksym Bondar on 30.07.2023.
//

import Foundation

struct ImageFactory {
    private static var uniqueImages = [String]()

    private static let images = ["bear", "buffalo", "chick", "chicken", "cow",
                          "crocodile", "dog", "duck", "elephant", "frog",
                          "girafee", "goat", "gorilla", "hippo", "horse",
                          "monkey", "moose", "narwhal", "owl", "panda",
                          "parrot", "penguin", "pig", "rabbit", "rhino",
                          "sloth", "snake", "walrus", "whale", "zebra"]

    static func resetFactory() {
        uniqueImages = images.shuffled()
    }

    static func randomUniqueAnimal() -> String {
        uniqueImages.removeFirst()
    }
}
