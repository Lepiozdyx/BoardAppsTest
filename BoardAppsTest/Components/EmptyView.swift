//
//  EmptyView.swift
//  BoardAppsTest
//
//  Created by Alex on 09.02.2024.
//

import SwiftUI

struct EmptyView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            VStack(spacing: 10) {
                Spacer()
                
                Text(title)
                    .foregroundColor(.primaryText)
                    .font(.system(size: 28, weight: .semibold, design: .default))
                    .kerning(-0.4)
                
                Text(subtitle)
                    .foregroundColor(.secondaryText)
                    .font(.system(size: 17, weight: .regular, design: .default))
                    .kerning(-0.4)
                
                Spacer()
                Spacer()
            }
        }
    }
}

#Preview {
    EmptyView(title: "No articles added", subtitle: "Add an article with the plus icon above")
}
