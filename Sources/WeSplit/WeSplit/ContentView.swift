//
//  ContentView.swift
//  WeSplit
//
//  Created by Maksym Bondar on 30.06.2023.
//

import SwiftUI
import TabularData

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    @FocusState private var amountIsFocused: Bool

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: currencyFormat)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)

                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }

                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                } header: {
                    Text("How much tip do you want to leave?")
                }

                Section {
                    Text(totalPerPerson, format: currencyFormat)
                } header: {
                    Text("Amount per person")
                }

                Section {
                    Text(totalAmount, format: currencyFormat)
                } header: {
                    Text("Total amount")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()

                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

private extension ContentView {
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        return checkAmount * (1 + tipSelection / 100)
    }

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        return totalAmount / peopleCount
    }

    var currencyFormat: FloatingPointFormatStyle<Double>.Currency {
        FloatingPointFormatStyle<Double>.Currency(code: Locale.current.currency?.identifier ?? "CAD")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
