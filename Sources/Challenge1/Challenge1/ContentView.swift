//
//  ContentView.swift
//  Challenge1
//
//  Created by Maksym Bondar on 03.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnits = UnitLength.meters
    @State private var outputUnits = UnitLength.meters
    @State private var convertValue = 0.0

    private let units = [UnitLength.meters, .kilometers, .feet, .miles]
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Units", selection: $inputUnits) {
                        ForEach(units, id: \.self) {
                            Text($0.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Select input units")
                }

                Section {
                    Picker("Units", selection: $outputUnits) {
                        ForEach(units, id: \.self) {
                            Text($0.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Select output units")
                }

                Section {
                    TextField("Input \(inputUnits.symbol)", value: $convertValue, format: .number)
                } header: {
                    Text("Convert units")
                }

                Section {
                    Text("\(convertValue.formatted()) \(inputUnits.symbol) in \(outputUnits.symbol) is equal \(convertedValue.formatted())")
                }
            }
            .navigationTitle("Unit conversion")
            .scrollDisabled(true)
        }
    }
}

private extension ContentView {
    var convertedValue: Double {
        var input = Measurement(value: convertValue, unit: inputUnits)
        input.convert(to: outputUnits)
        return input.value
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
