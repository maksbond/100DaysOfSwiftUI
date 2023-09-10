//
//  UsersListView.swift
//  Challenge5
//
//  Created by Maksym Bondar on 08.09.2023.
//

import SwiftUI

struct UsersListView: View {
    @Environment(\.managedObjectContext) var moc
    @Binding var users: [User]
    @FetchRequest(sortDescriptors: []) var cachedUsers: FetchedResults<CachedUser>

    var body: some View {
        Group {
            if cachedUsers.isEmpty {
                ProgressView()
            } else {
                List {
                    ForEach(cachedUsers) { user in
                        NavigationLink {
                            UserDetails(user: user)
                        } label: {
                            UserRow(user: user)
                        }
                    }
                }
            }
        }
        .onChange(of: users) { _ in
            Task {
                await cacheUsers()
            }
        }
    }
}

private extension UsersListView {
    func cacheUsers() async {
        await MainActor.run {
            for user in users {
                let cachedUser = CachedUser(context: moc)

                cachedUser.id = user.id
                cachedUser.isActive = user.isActive
                cachedUser.email = user.email
                cachedUser.company = user.company
                cachedUser.age = user.age
                cachedUser.name = user.name
                cachedUser.address = user.address
                cachedUser.about = user.about
                cachedUser.registered = user.registered
                cachedUser.tags = user.tags.joined(separator: ",")

                for friend in user.friends {
                    let cachedFriend = CachedFriend(context: moc)

                    cachedFriend.id = friend.id
                    cachedFriend.name = friend.name

                    cachedUser.addToFriends(cachedFriend)
                }
            }

            try? moc.save()
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
