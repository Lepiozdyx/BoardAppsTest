//
//  ArticleCellView.swift
//  BoardAppsTest
//
//  Created by Alex on 09.02.2024.
//

import SwiftUI

struct ArticleCellView: View {
    let article: Article
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.cardBackground)
            
            VStack(alignment: .leading, spacing: 8) {
                CategoryButtonView(category: article.category, isSelected: true, action: {})
                
                Text(article.title)
                    .foregroundColor(.primaryText)
                    .font(.titleFont(size: 22))
                    .kerning(-0.4)
            }
            .padding()
        }
        .frame(minHeight: 122)
    }
}

#Preview {
    ScrollView {
        ArticleCellView(article: Article.getMockData())
            .preferredColorScheme(.dark)
    }
}
