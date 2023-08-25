//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Maksym Bondar on 22.08.2023.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var orderItem: OrderItem

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $orderItem.order.name)
                TextField("Street address", text: $orderItem.order.streetAddress)
                TextField("City", text: $orderItem.order.city)
                TextField("Zip", text: $orderItem.order.zip)
            }

            Section {
                NavigationLink {
                    CheckoutView(orderItem: orderItem)
                } label: {
                    Text("Check out")
                }
                .disabled(!orderItem.order.isValidAddress)
            }
        }
            .navigationTitle("Delivery details")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(orderItem: OrderItem())
        }
    }
}
