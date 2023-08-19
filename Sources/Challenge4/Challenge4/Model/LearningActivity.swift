//
//  LearningActivity.swift
//  Challenge4
//
//  Created by Maksym Bondar on 19.08.2023.
//

import Foundation

struct LearningActivity: Codable, Identifiable, Equatable {
    var id: String = UUID().uuidString
    var title: String
    var description: String
    var completionNumber: Int = 1
}
