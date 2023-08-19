//
//  Activities.swift
//  Challenge4
//
//  Created by Maksym Bondar on 19.08.2023.
//

import Foundation

class Activities: ObservableObject {
    private let activitiesKey = "Activities.activities"

    @Published var activities: [LearningActivity]

    init() {
        guard let data = UserDefaults.standard.data(forKey: activitiesKey) else {
            activities = []
            return
        }
        activities = (try? JSONDecoder().decode([LearningActivity].self, from: data)) ?? []
    }

    func add(activity: LearningActivity) {
        if let index = activities.firstIndex(where: { $0.title.shinyTitle() == activity.title.shinyTitle() }) {
            activities[index].completionNumber += 1
        } else {
            activities.append(activity)
        }
    }

    func adjustCompletionCount(for activity: LearningActivity, with value: Int) {
        if let index = activities.firstIndex(where: { $0 == activity }) {
            activities[index].completionNumber = value
        }
    }

    func save() {
        guard let data = try? JSONEncoder().encode(activities) else {
            fatalError("Can't encode data")
        }

        UserDefaults.standard.set(data, forKey: activitiesKey)
    }
}

private extension String {
    func shinyTitle() -> String {
        self.lowercased().trimmingCharacters(in: .whitespaces)
    }
}
