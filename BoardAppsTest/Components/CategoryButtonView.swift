//
//  CategoryButtonView.swift
//  BoardAppsTest
//
//  Created by Alex on 09.02.2024.
//

import SwiftUI

struct CategoryButtonView: View {
    let category: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Text(category)
            .padding([.top, .bottom], 8)
            .padding([.leading, .trailing], 12)
            .foregroundColor(isSelected ? .primaryText : .secondaryText)
            .background(isSelected ? .accentColor : Color.accentColor.opacity(0.3))
            .font(.caption2)
            .clipShape(.capsule)
            .onTapGesture(perform: action)
    }
}

#Preview {
    ZStack {
        Color.background.ignoresSafeArea()
        HStack {
            CategoryButtonView(category: "basketball", isSelected: true, action: {})
            CategoryButtonView(category: "football", isSelected: false, action: {})
        }
    }
}
