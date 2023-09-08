//
//  UserRow.swift
//  Challenge5
//
//  Created by Maksym Bondar on 08.09.2023.
//

import SwiftUI

struct UserRow: View {
    var user: User

    var body: some View {
        HStack {
            VStack {
                Text(user.name)
                    .font(.body)

                Spacer(minLength: 4)

                Text(user.company)
                    .font(.caption)
            }

            Spacer()

            UserActivityIndicator(isActive: user.isActive)
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(user: User(id: "1",
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
                          ))
    }
}
