//
//  CardView.swift
//  Challenge3
//
//  Created by Maksym Bondar on 30.07.2023.
//

import SwiftUI

struct CardView: View {
    var text: String

    var body: some View {
        ZStack {
            Color.white
                .frame(width: 50, height: 50)

            Text(text)
                .font(.title)
        }
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .shadow(radius: 4)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView(text: "100")
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("CardView")

            CardView(text: "10")
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("CardView")

            CardView(text: "X")
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("CardView")
        }
    }
}
