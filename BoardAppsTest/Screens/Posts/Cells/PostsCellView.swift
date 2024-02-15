//
//  PostsCellView.swift
//  BoardAppsTest
//
//  Created by Alex on 15.02.2024.
//

import SwiftUI

struct PostsCellView: View {
    let post: Post
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.cardBackground)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(post.date.formatted())
                    .foregroundColor(.secondaryText)
                    .font(.bodyFont(size: 13))
                    .kerning(-0.4)
                
                Text(post.title)
                    .foregroundColor(.primaryText)
                    .font(.titleFont(size: 17))
                    .kerning(-0.4)
            }
            .padding()
        }
        .frame(minHeight: 98)
    }
}

#Preview {
    ScrollView {
        PostsCellView(post: Post.getMockData())
            .preferredColorScheme(.dark)
    }
}
