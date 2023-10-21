//
//  EditView.swift
//  Challenge6
//
//  Created by Maksym Bondar on 19.10.2023.
//

import MapKit
import SwiftUI

struct EditView: View {
    typealias SaveCompletion = (_ image: UIImage, _ name: String, _ description: String, _ location: Location?) -> Void

    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: ViewModel

    var image: UIImage
    var onSave: SaveCompletion

    private let locationFetcher = LocationFetcher()

    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()

            TextField("Name", text: $viewModel.name)
                .padding(4)
            TextField("Description", text: $viewModel.description)
                .padding(4)
                .lineLimit(1...3)

            if viewModel.isMapShown {
                Map(coordinateRegion: $viewModel.mapRegion, annotationItems: [viewModel.location ?? Location(id: UUID(), name: "Unknown", latitude: 50, longitude: 0)]) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        VStack {
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width: 44, height: 44)
                                .background(.white)
                                .clipShape(Circle())

                            Text(location.name)
                                .fixedSize()
                        }
                    }
                }
                .frame(height: 100)
                .padding()
                .disabled(true)
            }
            Button("Read Location") {
                if let location = self.locationFetcher.lastKnownLocation {
                    viewModel.location = Location(id: UUID(), name: "Buddy meet location", latitude: location.latitude, longitude: location.longitude)
                    print("Your location is \(location)")
                } else {
                    print("Your location is unknown")
                }
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)

            Spacer(minLength: 16)
        }
        .navigationTitle(viewModel.name.isEmpty ? "New User" : viewModel.name)
        .toolbar {
            Button("Save") {
                onSave(image, viewModel.name, viewModel.description, viewModel.location)
                dismiss()
            }
            .disabled(!viewModel.isNotReady)
        }
        .onAppear {
            locationFetcher.start()
        }
    }

    init(image: UIImage, name: String = "", description: String = "", onSave: @escaping SaveCompletion) {
        self.image = image
        _viewModel = StateObject(wrappedValue: ViewModel(name: name, description: description))
        self.onSave = onSave
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditView(image: UIImage(systemName: "person.crop.circle")!) { _, _, _, _ in

            }
        }
    }
}
