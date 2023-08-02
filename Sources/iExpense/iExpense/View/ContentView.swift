//
//  ContentView.swift
//  iExpense
//
//  Created by Maksym Bondar on 31.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false

    private let currencyCode = Locale.current.currency?.identifier ?? "USD"

    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.sections) { section in
                    Section(section.type) {
                        ForEach(section.items) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                        .font(.caption)
                                }

                                Spacer()

                                Text(item.amount, format: .currency(code: currencyCode))
                                    .padding()
                                    .background(item.amount > 100 ? .red : (item.amount < 10 ? .green : .yellow ))
                            }
                        }
                        .onDelete { offset in
                            removeItems(at: offset, in: section.id)
                        }
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
}

extension ContentView {
    func removeItems(at offsets: IndexSet, in index: Int) {
        expenses.removeItems(at: offsets, in: index)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
