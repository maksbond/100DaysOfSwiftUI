//
//  ContentView.swift
//  Challenge4
//
//  Created by Maksym Bondar on 19.08.2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) private var scenePhase

    @StateObject var data = Activities()

    @State private var isSheetPresented = false
    
    var body: some View {
        NavigationView {
            ActivitiesView(data: data)
                .navigationTitle("Learning Activities")
                .toolbar {
                    Button(action: addActivity) {
                        Image(systemName: "note.text.badge.plus")
                    }
                }
                .sheet(isPresented: $isSheetPresented) {
                    AddActivityView(data: data)
                }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .background ||
                phase == .inactive {
                data.save()
            }
        }
    }
}

extension ContentView {
    func addActivity() {
        isSheetPresented = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
