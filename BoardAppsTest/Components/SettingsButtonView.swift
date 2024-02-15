//
//  SettingsButtonView.swift
//  BoardAppsTest
//
//  Created by Alex on 15.02.2024.
//

import SwiftUI

struct SettingsButtonView: View {
    let icon: ImageResource
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(background)
                
                VStack(alignment: .leading, spacing: 14) {
                    Image(icon)
                    
                    Text(title)
                        .foregroundColor(.primaryText)
                        .font(.bodyFont(size: 15))
                        .kerning(-0.4)
                }
                .padding(.leading)
            }
            .frame(height: 111)
        }
    }
}

#Preview {
    SettingsButtonView(icon: .icShare, title: "Share app", background: .cardBackground, action: {})
        .preferredColorScheme(.dark)
}
