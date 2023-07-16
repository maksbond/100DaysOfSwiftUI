//
//  GameMoveView.swift
//  Challenge2
//
//  Created by Maksym Bondar on 15.07.2023.
//

import SwiftUI

struct GameMoveView: View {
    private let moveColors = [Color.red, .blue, .yellow, .orange, .purple]
    var move: Move

    var body: some View {
        ZStack {
            AngularGradient(stops: [.init(color: moveColors.randomElement() ?? .clear, location: 0.0),
                                    .init(color: moveColors.randomElement() ?? .clear, location: 0.2),
                                    .init(color: moveColors.randomElement() ?? .clear, location: 0.4),
                                    .init(color: moveColors.randomElement() ?? .clear, location: 0.6),
                                    .init(color: moveColors.randomElement() ?? .clear, location: 0.8),
                                    .init(color: moveColors.randomElement() ?? .clear, location: 1.0)],
                            center: .center)
            .clipShape(Circle())

            move.icon
                .font(.system(size: 50))
        }
    }
}

struct GameMoveView_Previews: PreviewProvider {
    static var previews: some View {
        GameMoveView(move: .rock)
            .frame(width: 150, height: 150)
    }
}
