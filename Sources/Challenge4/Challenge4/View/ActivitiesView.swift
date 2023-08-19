//
//  ActivitiesView.swift
//  Challenge4
//
//  Created by Maksym Bondar on 19.08.2023.
//

import SwiftUI

struct ActivitiesView: View {
    @ObservedObject var data: Activities

    var body: some View {
        if data.activities.isEmpty {
            VStack {
                Image(systemName: "circle.dashed")
                    .resizable()
                    .frame(width: 44, height: 44)
                    .foregroundColor(.primary)
                Text("Oops, loos like there's no data...")
                    .foregroundColor(.secondary)
            }
        } else {
            List {
                ForEach(data.activities) { [weak data] activity in
                    NavigationLink {
                        ActivityDetails(
                            title: activity.title,
                            description: activity.description,
                            completionCount: Binding(get: {
                                activity.completionNumber
                            }, set: { value, _ in
                                data?.adjustCompletionCount(for: activity, with: value)
                            }))
                    } label: {
                        ActivityRow(title: activity.title, description: activity.description, completionNumber: activity.completionNumber)
                    }
                }
            }
        }
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var activitiesData = Activities()

    static var previews: some View {
        NavigationView {
            ActivitiesView(data: activitiesData)
                .navigationTitle("Learning Activities")
        }
    }
}
