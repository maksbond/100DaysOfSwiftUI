//
//  UsersListView.swift
//  Challenge5
//
//  Created by Maksym Bondar on 08.09.2023.
//

import SwiftUI

struct UsersListView: View {
    @Binding var users: [User]

    var body: some View {
        List {
            ForEach(users) { user in
                NavigationLink {
                    UserDetails(user: user)
                } label: {
                    UserRow(user: user)
                }
            }
        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    @State private static var users = [
        User(id: "1",
             isActive: true,
             name: "Test 1",
             age: 10,
             company: "Test 1",
             email: "test@gmail.com",
             address: "random 14",
             about: "jhflkajlk fjldjglj ldjgj ",
             registered: Date.now,
             tags: ["1", "2"],
             friends: [
                Friend(id: "3", name: "Test 3"),
                Friend(id: "4", name: "Test 4"),
             ]
        ),
        User(id: "2",
             isActive: false,
             name: "Test 2",
             age: 10,
             company: "Test 2",
             email: "tes2@gmail.com",
             address: "random 1",
             about: "jhflkajlk fjldjglj ldjgj ",
             registered: Date.now,
             tags: ["1", "2"],
             friends: [
                Friend(id: "5", name: "Test 5"),
                Friend(id: "6", name: "Test 6"),
             ]
            )
    ]

    static var previews: some View {
        NavigationView {
            UsersListView(users: $users)
                .navigationTitle("Users")
        }
    }
}
