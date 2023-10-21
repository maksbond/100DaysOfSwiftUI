//
//  ContentView.swift
//  Challenge6
//
//  Created by Maksym Bondar on 16.10.2023.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.buddies) { buddy in
                    NavigationLink {
                        Image(uiImage: buddy.image)
                            .resizable()
                            .scaledToFit()
                        if let location = buddy.location,
                           let region = buddy.mapCoordinateRegion {
                            Map(coordinateRegion: Binding(get: {
                                region
                            }, set: { _ in
                            }), annotationItems: [location]) { location in
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
                    } label: {
                        HStack {
                            Image(uiImage: buddy.image)
                                .resizable()
                                .frame(width: 44, height: 44)
                                .clipShape(Rectangle())

                            VStack {
                                Text(buddy.name)
                                    .font(.headline)

                                Text(buddy.description)
                                    .font(.subheadline)
                            }
                        }
                        .padding()
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("New Buddies")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        viewModel.showingImagePicker = true
                    }
                }
            }
            .sheet(isPresented: $viewModel.showingImagePicker) {
                ImagePicker(image: $viewModel.selectedImage)
            }
            .sheet(item: $viewModel.selectedImage) { image in
                NavigationView {
                    EditView(image: image) { image, name, description, location in
                        viewModel.createNewBuddy(with: image, name: name, description: description, location: location)
                    }
                }
            }
        }
    }
}

private extension ContentView {
    func delete(at offsets: IndexSet) {
        viewModel.delete(on: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
