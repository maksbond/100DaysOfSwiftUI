//
//  UserDetails.swift
//  Challenge5
//
//  Created by Maksym Bondar on 08.09.2023.
//

import SwiftUI

struct UserDetails: View {
    let user: User
    var body: some View {
        ScrollView(.vertical) {
            Section("User info") {
                HStack {
                    Text("ID: \(user.id)")
                        .font(.headline)
                    Spacer()

                    UserActivityIndicator(isActive: user.isActive)
                }
                .padding()

                Group {
                    HStack {
                        Text("Company: \(user.company)")
                        Spacer()
                    }
                    .padding(.horizontal)

                    HStack {
                        Text("Address: \(user.address)")
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                .font(.subheadline)


                HStack {
                    Text("Registered in:")
                        .font(.subheadline)
                    Spacer()

                    Text(user.registered, format: .dateTime)
                        .font(.subheadline)
                }
                .padding()

                Text(user.about)
                    .font(.body)
                    .padding()
            }

            Section("TAGS") {
                HStack {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(user.tags, id: \.self) { tag in
                                Text(tag)
                                    .font(.body)
                                    .padding(4)
                                    .background(.gray.opacity(0.3))
                                    .clipShape(Capsule())
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                .padding(.horizontal)
            }

            Section("Friends list") {
                ForEach(user.friends) { friend in
                    VStack {
                        HStack {
                            Text(friend.name)
                                .font(.headline)
                            Spacer()
                        }

                        HStack {
                            Text(friend.id)
                                .font(.subheadline)
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(user.name)
    }
}

struct UserDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetails(user: User(id: "1",
                                   isActive: true,
                                   name: "Test 1",
                                   age: 10,
                                   company: "Test 1",
                                   email: "test@gmail.com",
                                   address: "random 14",
                                   about: "jhflkajlk fjldjglj ldjgj ",
                                   registered: Date.now,
                                   tags: ["12342", "2324234 "],
                                   friends: [
                                        Friend(id: "3", name: "Test 3"),
                                        Friend(id: "4", name: "Test 4"),
                                   ]
                        ))
        }
    }
}
