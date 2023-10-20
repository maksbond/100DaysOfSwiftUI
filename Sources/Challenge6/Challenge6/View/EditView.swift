//
//  EditView.swift
//  Challenge6
//
//  Created by Maksym Bondar on 19.10.2023.
//

import SwiftUI

struct EditView: View {
    typealias SaveCompletion = (_ image: UIImage, _ name: String, _ description: String) -> Void

    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: ViewModel

    var image: UIImage
    var onSave: SaveCompletion

    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: .infinity, height: 250)

            TextField("Name", text: $viewModel.name)
                .padding()
            TextField("Description", text: $viewModel.description)
                .padding()
                .lineLimit(1...3)

            Spacer(minLength: 16)
        }
        .navigationTitle(viewModel.name.isEmpty ? "New User" : viewModel.name)
        .toolbar {
            Button("Save") {
                onSave(image, viewModel.name, viewModel.description)
                dismiss()
            }
            .disabled(!viewModel.isNotReady)
        }
    }

    init(image: UIImage, name: String = "", description: String = "", onSave: @escaping SaveCompletion) {
        self.image = image
        _viewModel = StateObject(wrappedValue: ViewModel(name: name, description: description))
        self.onSave = onSave
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditView(image: UIImage(systemName: "person.crop.circle")!) { _, _, _ in

            }
        }
    }
}
