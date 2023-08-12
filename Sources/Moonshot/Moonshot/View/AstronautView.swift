//
//  AstronautView.swift
//  Moonshot
//
//  Created by Maksym Bondar on 11.08.2023.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut

    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()

                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static var astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        NavigationView {
            AstronautView(astronaut: astronauts["armstrong"]!)
        }
        .preferredColorScheme(.dark)
    }
}
