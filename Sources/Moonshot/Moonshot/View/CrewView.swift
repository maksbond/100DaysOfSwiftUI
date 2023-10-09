//
//  CrewView.swift
//  Moonshot
//
//  Created by Maksym Bondar on 12.08.2023.
//

import SwiftUI

struct CrewView: View {
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay {
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                }

                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)

                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                        .accessibilityElement()
                        .accessibilityLabel("\(crewMember.astronaut.name), \(crewMember.role)")
                    }
                }
            }
        }
    }
}

struct CrewView_Previews: PreviewProvider {
    static var missions: [Mission] = Bundle.main.decode("missions.json")
    static var astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static func crewList() -> [MissionView.CrewMember] {
        missions[0].crew.map({ crewRole in
            guard let astronaut = astronauts[crewRole.name] else {
                fatalError("Missing \(crewRole.name)")
            }

            return MissionView.CrewMember(role: crewRole.role, astronaut: astronaut)
        })
    }
    
    static var previews: some View {
        NavigationView {
            CrewView(crew: crewList())
                .preferredColorScheme(.dark)
                .background(.darkBackground)
        }
    }
}
