//
//  ContentView+ViewModel.swift
//  Challenge6
//
//  Created by Maksym Bondar on 16.10.2023.
//

import UIKit

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var buddies: [NewBuddy]
        @Published var selectedImage: UIImage?
        @Published var showingImagePicker = false
        @Published var isErrorShown = false
        @Published var errorMessage = ""

        private let savePath = FileManager.documentsDirectory
        private let listName = "Buddies_list.json"

        init() {
            do {
                let data = try Data(contentsOf: savePath.appending(path: listName))
                buddies = try JSONDecoder().decode([NewBuddy].self, from: data)
            } catch {
                buddies = []
            }
        }

        func createNewBuddy(with image: UIImage, name: String, description: String) {
            guard let jpegData = image.jpegData(compressionQuality: 0.8) else {
                isErrorShown = true
                errorMessage = "Can't decode image!"
                return
            }

            let id = UUID().uuidString
            let imageName = "\(id).jpeg"
            let url = savePath.appending(component: imageName, directoryHint: .notDirectory)
            do {
                try jpegData.write(to: url, options: [.atomic, .completeFileProtection])
                let newBuddy = NewBuddy(id: id, imageName: imageName, name: name, description: description)
                buddies.append(newBuddy)
                save()
            } catch {
                isErrorShown = true
                errorMessage = "Can't save image!"
                print(error.localizedDescription)
            }
        }

        func delete(on offsets: IndexSet) {
            buddies.remove(atOffsets: offsets)
            save()
        }

        private func save() {
            do {
                let data = try JSONEncoder().encode(buddies)
                try data.write(to: savePath.appending(path: listName), options: [.atomic, .completeFileProtection])
            } catch {
                isErrorShown = true
                errorMessage = "Unable to save Buddies!"
            }
        }
    }
}

extension UIImage: Identifiable {
    public var id: String {
        String(describing: self)
    }
}
