//
//  MissionView.swift
//  Moonshot
//
//  Created by Maksym Bondar on 11.08.2023.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }

    let mission: Mission
    let crew: [CrewMember]

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                        .accessibilityLabel(mission.displayName)


                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()

                            VStack {
                                Text("Launch Date")
                                    .font(.caption.bold())
                                Text(mission.formattedLaunchDate)
                                    .font(.caption2)
                            }
                            .padding([.top, .bottom], 4)

                            Spacer()
                        }
                        .accessibilityElement()
                        .accessibilityLabel("Launch date: \(mission.formattedLaunchDate)")

                        CustomDivider()

                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)

                        Text(mission.description)

                        CustomDivider()

                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)

                    CrewView(crew: crew)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }

    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map({ crewRole in
            guard let astronaut = astronauts[crewRole.name] else {
                fatalError("Missing \(crewRole.name)")
            }

            return CrewMember(role: crewRole.role, astronaut: astronaut)
        })
    }
}

struct MissionView_Previews: PreviewProvider {
    static var missions: [Mission] = Bundle.main.decode("missions.json")
    static var astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        NavigationView {
            MissionView(mission: missions[0], astronauts: astronauts)
        }
        .preferredColorScheme(.dark)
    }
}
