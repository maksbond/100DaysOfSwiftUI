//
//  User.swift
//  Challenge5
//
//  Created by Maksym Bondar on 08.09.2023.
//

import Foundation

struct User: Decodable, Identifiable, Equatable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int16
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
}
