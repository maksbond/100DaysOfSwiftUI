//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Maksym Bondar on 14.07.2023.
//

import SwiftUI

struct FlagImage: View {
    var flagName: String

    var body: some View {
        Image(flagName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(color: .blue, radius: 5)
    }
}

struct FlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(flagName: "France")
    }
}
