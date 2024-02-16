//
//  ActionButtonView.swift
//  BoardAppsTest
//
//  Created by Alex on 08.02.2024.
//

import SwiftUI

struct ActionButtonView: View {
    let name: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(name)
                .foregroundColor(.primaryText)
                .font(.bodyFont(size: 17))
                .kerning(-0.4)
                .frame(maxWidth: .infinity, maxHeight: 62)
                .background(Color.accentColor)
                .clipShape(.rect(cornerRadius: 20))
        }
    }
}

#Preview {
    ActionButtonView(name: "Next", action: {})
}
