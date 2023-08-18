//
//  ArrowView.swift
//  Drawing
//
//  Created by Maksym Bondar on 18.08.2023.
//

import SwiftUI

struct ArrowView: View {
    @State private var lineWidth: CGFloat = 5
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()

            VStack {
                Text("Line Width")
                    .font(.title)

                Text(lineWidth, format: .number)
                    .font(.headline)
            }
            .foregroundColor(.primary)
            .offset(CGSize(width: 0, height: -200))

            Arrow()
                .stroke(.red, style: StrokeStyle(lineWidth: lineWidth, lineCap: .square, lineJoin: .round))
                .frame(width: 300, height: 300)
        }
        .onTapGesture {
            withAnimation {
                lineWidth = ceil(CGFloat.random(in: 1...25))
            }
        }
    }
}

struct ArrowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ArrowView()
                .navigationTitle("Arrow View")
                .navigationBarTitleDisplayMode(.inline)
                .preferredColorScheme(.dark)
        }
    }
}
