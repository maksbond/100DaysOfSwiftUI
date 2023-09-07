//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Maksym Bondar on 05.09.2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"

    @State private var predicate = FirterPredicate.beginsWith(caseSensitive: true)

    @State private var sortDescriptor = NSSortDescriptor(key: "firstName", ascending: true)

    var body: some View {
        VStack {
            FilteredList(
                filterKey: "lastName",
                filterValue: lastNameFilter,
                predicate: predicate,
                sortDescriptors: [
                    sortDescriptor
                ]
            ) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }

            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Aston"
                taylor.lastName = "Swift"

                let ed = Singer(context: self.moc)
                ed.firstName = "iOS"
                ed.lastName = "Sheeran"

                let adele = Singer(context: self.moc)
                adele.firstName = "Kotlin"
                adele.lastName = "Adkins"

                try? self.moc.save()
            }

            Button("Show A") {
                self.lastNameFilter = "A"
            }

            Button("Show S") {
                self.lastNameFilter = "S"
            }

            VStack {
                Text("Predicates")

                HStack {
                    Text("BEGINSWITH")
                    Button("Case Sensitive") {
                        predicate = .beginsWith(caseSensitive: true)
                    }
                    Button("Case Insensitive") {
                        predicate = .beginsWith(caseSensitive: false)
                    }
                }

                HStack {
                    Text("CONTAINS")
                    Button("Case Sensitive") {
                        predicate = .contains(caseSensitive: true)
                    }
                    Button("Case Insensitive") {
                        predicate = .contains(caseSensitive: false)
                    }
                }
            }

            VStack {
                Text("Sort by")
                Button("First Name") {
                    sortDescriptor = NSSortDescriptor(key: "firstName", ascending: true)
                }
                Button("Last Name") {
                    sortDescriptor = NSSortDescriptor(key: "lastName", ascending: true)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
