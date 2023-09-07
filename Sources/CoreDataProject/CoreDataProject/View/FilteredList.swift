//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Maksym Bondar on 07.09.2023.
//

import CoreData
import SwiftUI

enum FirterPredicate {
    case beginsWith(caseSensitive: Bool)
    case contains(caseSensitive: Bool)

    var unwrapped: String {
        switch self {
        case .beginsWith(let caseSensitive):
            return caseSensitive ? "%K BEGINSWITH %@" : "%K BEGINSWITH[c] %@"
        case .contains(let caseSensitive):
            return caseSensitive ? "%K CONTAINS %@" : "%K CONTAINS[c] %@"
        }
    }
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> { fetchRequest.wrappedValue }

    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }

    init(filterKey: String,
         filterValue: String,
         predicate: FirterPredicate,
         sortDescriptors: [NSSortDescriptor],
         @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(),
                                       sortDescriptors: sortDescriptors,
                                       predicate: NSPredicate(format: predicate.unwrapped, filterKey, filterValue))
        self.content = content
    }
}

