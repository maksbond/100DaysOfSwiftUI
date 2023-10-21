//
//  EditView+ViewModel.swift
//  Challenge6
//
//  Created by Maksym Bondar on 19.10.2023.
//

import Foundation
import MapKit

extension EditView {
    class ViewModel: ObservableObject {
        @Published var name: String
        @Published var description: String
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))

        var isMapShown: Bool {
            location != nil
        }
        var location: Location? {
            didSet {
                guard let location else { return }
                mapRegion.center = location.coordinate
            }
        }

        var isNotReady: Bool {
            !name.isEmpty && !description.isEmpty
        }

        init(name: String, description: String) {
            self.name = name
            self.description = description
        }
    }
}
