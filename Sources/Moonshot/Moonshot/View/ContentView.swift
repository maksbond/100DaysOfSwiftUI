//
//  ContentView.swift
//  Moonshot
//
//  Created by Maksym Bondar on 05.08.2023.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    let gridColumns = [
        GridItem(.adaptive(minimum: 150))
    ]

    let listColumns = [
        GridItem(.flexible())
    ]

    @State private var isListGrid = false

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: isListGrid ? listColumns : gridColumns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()

                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)

                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            }
                            .accessibilityElement()
                            .accessibilityLabel("Mission: \(mission.displayName))")
                            .accessibilityHint("Launched on \(mission.formattedLaunchDate)")

                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Toggle("List", isOn: $isListGrid)
                    .toggleStyle(SwitchToggleStyle(tint: .lightBackground))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
