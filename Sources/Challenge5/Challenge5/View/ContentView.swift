//
//  ContentView.swift
//  Challenge5
//
//  Created by Maksym Bondar on 08.09.2023.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @State private var users = [User]()

    @State private var errorMessage = ""
    @State private var isErrorShown = false

    var body: some View {
        NavigationView {
            UsersListView(users: $users)
            .navigationTitle("Users")
        }
        .task {
            await downloadData()
        }
        .alert("Error", isPresented: $isErrorShown) {
            Text(errorMessage)
        }
    }
}

private extension ContentView {
    func downloadData() async {
        do {
            let (data, _) = try await URLSession.shared.data(for: URLRequest(url: URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!))
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            users = try decoder.decode([User].self, from: data)
        } catch {
            errorMessage = error.localizedDescription
            isErrorShown = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
