//
//  ActivityDetails.swift
//  Challenge4
//
//  Created by Maksym Bondar on 19.08.2023.
//

import SwiftUI

struct ActivityDetails: View {
    let title: String
    let description: String
    @Binding var completionCount: Int

    var body: some View {
        List {
            Section("Title") {
                Text(title)
            }

            Section("Description") {
                Text(description)
                    .multilineTextAlignment(.leading)
            }

            Section("Completion count") {
                HStack {
                    Text("\(completionCount)")

                    Spacer()

                    Button("Increase", action: adjustCompletionCount)
                }
            }
        }
    }
}

extension ActivityDetails {
    func adjustCompletionCount() {
        completionCount += 1
    }
}

struct ActivityDetails_Previews: PreviewProvider {
    @State static var completionCount = 1

    static var previews: some View {
        ActivityDetails(title: "Test", description: "sjglkjslk lksjg lksjgj slkjg lkjsglk jslkjglk sj", completionCount: $completionCount)
    }
}
