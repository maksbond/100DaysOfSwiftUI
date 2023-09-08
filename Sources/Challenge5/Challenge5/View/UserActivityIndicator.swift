//
//  UserActivityIndicator.swift
//  Challenge5
//
//  Created by Maksym Bondar on 08.09.2023.
//

import SwiftUI

struct UserActivityIndicator: View {
    var isActive: Bool
    
    var body: some View {
        Circle()
            .fill(isActive ? .green : .red)
            .frame(width: 10)
            .offset(y: -10)
    }
}

struct UserActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        UserActivityIndicator(isActive: true)
    }
}
