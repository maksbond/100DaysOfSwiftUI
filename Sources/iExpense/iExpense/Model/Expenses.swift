//
//  Expenses.swift
//  iExpense
//
//  Created by Maksym Bondar on 01.08.2023.
//

import Foundation

class Expenses: ObservableObject {
    @Published var sections = [SectionType]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(sections) {
                UserDefaults.standard.set(encoded, forKey: "Expenses.sections")
            }
        }
    }

    init() {
        guard let savedItems = UserDefaults.standard.data(forKey: "Expenses.sections"),
              let decodedItems = try? JSONDecoder().decode([SectionType].self, from: savedItems) else {
            sections = [
                SectionType(id: 0, type: "Business", items: []),
                SectionType(id: 1, type: "Personal", items: [])
            ]
            return
        }

        sections = decodedItems
    }

    func insert(item: ExpenseItem) {
        let index = sections.firstIndex(where: { $0.type == item.type }) ?? sections.startIndex
        sections[index].items.append(item)
    }

    func removeItems(at offsets: IndexSet, in index: Int) {
        sections[index].items.remove(atOffsets: offsets)
    }
}
