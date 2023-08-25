//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Maksym Bondar on 21.08.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var orderItem = OrderItem()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $orderItem.order.type) {
                        ForEach(OrderItem.types.indices) {
                            Text(OrderItem.types[$0])
                        }
                    }

                    Stepper("Number of cakes: \(orderItem.order.quantity)", value: $orderItem.order.quantity, in: 3...20)
                }

                Section {
                    Toggle("Any special requests?", isOn: $orderItem.order.specialRequestEnabled.animation())

                    if orderItem.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $orderItem.order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $orderItem.order.addSprinkles)
                    }
                }

                Section {
                    NavigationLink {
                        AddressView(orderItem: orderItem)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
