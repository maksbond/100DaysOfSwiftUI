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
    private let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()

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
                            .accessibilityElement()
                            .accessibilityLabel("\(item.name), \(currencyFormatter.string(from: NSNumber(value: item.amount)) ?? "Unknown value")")
                            .accessibilityHint(item.type)
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
