//
//  CustomDivider.swift
//  Moonshot
//
//  Created by Maksym Bondar on 12.08.2023.
//

import SwiftUI

struct CustomDivider: View {
    let height: CGFloat = 2
    let color: Color = .lightBackground
    
    var body: some View {
        Rectangle()
            .frame(height: height)
            .foregroundColor(color)
            .padding(.vertical)
            .accessibilityHidden(true)
    }
}

struct CustomDivider_Previews: PreviewProvider {
    static var previews: some View {
        CustomDivider()
            .preferredColorScheme(.dark)
    }
}
