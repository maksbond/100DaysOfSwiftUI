//
//  ActivityRow.swift
//  Challenge4
//
//  Created by Maksym Bondar on 19.08.2023.
//

import SwiftUI

struct ActivityRow: View {
    var title: String
    var description: String
    var completionNumber: Int

    private var image: String {
        completionNumber > 50 ? "circle.grid.3x3.circle.fill" : "\(completionNumber).circle.fill"
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .multilineTextAlignment(.leading)
                    .font(.title2)
                Text(description.isEmpty ? "N/A" : description)
                    .multilineTextAlignment(.leading)
                    .font(.caption)
            }
            .padding(.leading)

            Image(systemName: image)
                .foregroundColor(.gray)
                .padding(4)

            Spacer(minLength: 16)
        }
    }
}

struct ActivityRow_Previews: PreviewProvider {
    static var previews: some View {
        ActivityRow(title: "Challenge", description: "Challenge task", completionNumber: 50)
    }
}
