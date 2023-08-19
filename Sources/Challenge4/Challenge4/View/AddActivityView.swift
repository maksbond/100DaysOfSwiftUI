//
//  AddActivityView.swift
//  Challenge4
//
//  Created by Maksym Bondar on 19.08.2023.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(\.dismiss) private var dismiss

    @ObservedObject var data: Activities
    @State private var title: String = ""
    @State private var description: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section("Title") {
                    TextField("Input activity title", text: $title)
                }

                Section("Description") {
                    TextField("Input activity description", text: $description, axis: .vertical)
                }
            }
            .navigationTitle("Add learning activity")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Done", action: addActivity)
            }
        }
    }
}

extension AddActivityView {
    func addActivity() {
        if !title.isEmpty {
            data.add(activity: LearningActivity(title: title, description: description))
            title = ""
            description = ""
        }
        dismiss()
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var activitiesData = Activities()

    static var previews: some View {
        AddActivityView(data: activitiesData)
    }
}
