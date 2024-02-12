//
//  EventsCellView.swift
//  BoardAppsTest
//
//  Created by Alex on 12.02.2024.
//

import SwiftUI

struct EventsCellView: View {
    let event: Event
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color.cardBackground)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    CategoryButtonView(category: event.category, isSelected: true, action: {})
                    
                    Text(event.date.formatted())
                        .foregroundColor(.primaryText)
                        .font(.caption2)
                    
                    Spacer()
                    
                    Text(event.location)
                        .foregroundColor(.secondaryText)
                        .font(.bodyFont(size: 15))
                        .kerning(-0.4)
                }
                
                Text("\(event.teamOne) VS \(event.teamTwo)")
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
    ZStack {
        Color.background.ignoresSafeArea()
        EventsCellView(event: Event.getMockData())
    }
}
