//
//  FlippingCard.swift
//  Challenge3
//
//  Created by Maksym Bondar on 30.07.2023.
//

import SwiftUI

struct FlippingCard: View {
    @Binding var isPlayed: Bool
    @Binding var userInput: Int?
    @Binding var isCorrect: Bool

    var imageName: String

    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .frame(width: 50, height: 50)

            if isPlayed {
                Text(isCorrect ? "✅" : "❌")
                    .frame(width: 35, height: 35)
                    .background(.white)
            } else {
                TextField("", value: $userInput, format: .number)
                    .background(.white)
                    .frame(width: 35, height: 35)
                    .multilineTextAlignment(.center)
                    .keyboardType(.decimalPad)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .shadow(radius: 4)
        .rotation3DEffect(Angle(degrees: isPlayed ? 360 : 0), axis: (x: 0, y: 1, z: 0))
    }
}

struct FlippingCard_Previews: PreviewProvider {
    @State static private var isPlayed = false
    @State static private var userInput: Int?
    @State static private var isCorrect = false

    static var previews: some View {
        FlippingCard(isPlayed: $isPlayed, userInput: $userInput, isCorrect: $isCorrect, imageName: "zebra")
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Dynamic Flipping Card")
    }
}
