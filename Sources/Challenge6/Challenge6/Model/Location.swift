//
//  Location.swift
//  BucketList
//
//  Created by Maksym Bondar on 27.09.2023.
//

import CoreLocation

struct Location: Identifiable, Codable, Equatable {
    var id: UUID
    var name: String
    let latitude: Double
    let longitude: Double

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    static let example = Location(id: UUID(), name: "Buckingham Palace", latitude: 51.501, longitude: -0.141)

    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
