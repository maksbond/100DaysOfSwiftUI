//
//  Expenses.swift
//  iExpense
//
//  Created by Maksym Bondar on 01.08.2023.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Expenses.items")
            }
        }
    }

    init() {
        guard let savedItems = UserDefaults.standard.data(forKey: "Expenses.items"),
              let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) else {
            items = []
            return
        }

        items = decodedItems
    }
}
