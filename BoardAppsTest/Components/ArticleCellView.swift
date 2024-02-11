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
            
            VStack(alignment: .leading, spacing: 4) {
                CategoryButtonView(category: article.category, isSelected: true, action: {})
                
                Text(article.title)
                    .foregroundColor(.primaryText)
                    .font(.system(size: 22, weight: .semibold, design: .default))
                    .kerning(-0.4)
            }
            .padding()
        }
        .frame(minHeight: 122)
    }
}

#Preview {
    ZStack {
        Color.background.ignoresSafeArea()
        ArticleCellView(article: Article.getMockData())
    }
}
