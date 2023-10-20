//
//  NewBuddy.swift
//  Challenge6
//
//  Created by Maksym Bondar on 16.10.2023.
//

import UIKit

struct NewBuddy: Codable, Comparable, Equatable, Identifiable {
    var id: String
    var imageName: String
    var name: String
    var description: String

    var imageURL: URL {
        FileManager.documentsDirectory.appending(path: imageName)
    }

    var image: UIImage {
        let data = try? Data(contentsOf: imageURL)
        return UIImage(data: data ?? Data()) ?? UIImage(systemName: "person.crop.circle")!
    }

    static func < (lhs: NewBuddy, rhs: NewBuddy) -> Bool {
        lhs.name < rhs.name
    }
}
