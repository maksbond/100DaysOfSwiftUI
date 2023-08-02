//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Maksym Bondar on 01.08.2023.
//

import Foundation

struct SectionType: Identifiable, Codable {
    var id: Int
    var type: String
    var items: [ExpenseItem]
}

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
