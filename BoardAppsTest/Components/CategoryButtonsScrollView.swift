//
//  CategoryButtonsScrollView.swift
//  BoardAppsTest
//
//  Created by Alex on 09.02.2024.
//

import SwiftUI

struct CategoryButtonsScrollView: View {
    let categories = ["basketball", "football", "volleyball", "hockey", "box", "golf", "other"]
    let selectedCategory: String
    var action: (String) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(categories, id: \.self) { category in
                    CategoryButtonView(
                        category: category,
                        isSelected: selectedCategory == category,
                        action: {action(category)}
                    )
                }
            }
        }
    }
}

#Preview {
    ZStack {
        Color.background.ignoresSafeArea()
        CategoryButtonsScrollView(selectedCategory: "football", action: {_ in })
    }
}
