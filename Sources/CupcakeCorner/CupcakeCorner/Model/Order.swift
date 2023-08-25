//
//  Order.swift
//  CupcakeCorner
//
//  Created by Maksym Bondar on 22.08.2023.
//

import SwiftUI

struct Order: Codable {
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }

    var type = 0
    var quantity = 3

    var specialRequestEnabled = false {
        didSet {
            if !specialRequestEnabled {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }

    var extraFrosting = false
    var addSprinkles = false

    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""

    var isValidAddress: Bool {
        !(name.isEmpty || city.isEmpty || zip.isEmpty) && isStreetAddressValid
    }

    private var isStreetAddressValid: Bool {
        !streetAddress.isEmpty && !streetAddress.trimmingCharacters(in: .whitespaces).isEmpty
    }

    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2

        // complicated cakes cost more
        cost += (Double(type) / 2)

        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }

        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }

        return cost
    }
}

class OrderItem: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    @Published var order = Order()
}
