//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Maksym Bondar on 19.11.2023.
//

import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}

private enum SortOrder {
    case `default`, alphabetical, country
}

struct ContentView: View {
    @State private var searchText = ""
    @State private var showingFilterOptions = false
    @State private var sortingOrder = SortOrder.default
    @StateObject var favorites = Favorites()

    private let resorts: [Resort] = Bundle.main.decode("resorts.json")

    var filteredResorts: [Resort] {
        var result = resorts
        if !searchText.isEmpty {
            result = result.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }

        switch sortingOrder {
        case .default:
            return result
        case .alphabetical:
            return result.sorted(by: { $0.name > $1.name})
        case .country:
            return result.sorted(by: { $0.country > $1.country})
        }
    }

    var body: some View {
        NavigationView {
            List(filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )

                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }

                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                            .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                Button {
                    showingFilterOptions.toggle()
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                }

            }
            .confirmationDialog("Filter by", isPresented: $showingFilterOptions, titleVisibility: .visible) {
                Button("Default") {
                    sortingOrder = .default
                }

                Button("Alphabetical") {
                    sortingOrder = .alphabetical
                }

                Button("Country") {
                    sortingOrder = .country
                }
            }

            WelcomeView()
        }
        .environmentObject(favorites)
        .phoneOnlyStackNavigationView()
    }
}

#Preview {
    ContentView()
}
