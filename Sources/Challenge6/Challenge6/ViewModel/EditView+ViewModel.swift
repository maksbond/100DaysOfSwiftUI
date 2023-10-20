//
//  EditView+ViewModel.swift
//  Challenge6
//
//  Created by Maksym Bondar on 19.10.2023.
//

import Foundation

extension EditView {
    class ViewModel: ObservableObject {
        @Published var name: String
        @Published var description: String

        var isNotReady: Bool {
            !name.isEmpty && !description.isEmpty
        }

        init(name: String, description: String) {
            self.name = name
            self.description = description
        }
    }
}
