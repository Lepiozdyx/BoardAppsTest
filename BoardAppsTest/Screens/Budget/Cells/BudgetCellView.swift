//
//  BudgetCellView.swift
//  BoardAppsTest
//
//  Created by Alex on 13.02.2024.
//

import SwiftUI

struct BudgetCellView: View {
    let budget: Budget
    let action: () -> Void
    
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color.cardBackground)
            
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(budget.date.formatted())
                            .foregroundColor(.secondaryText)
                            .font(.caption2)
                        
                        Spacer()
                        
                        Button(action: action) {
                            Image(.icBin)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 24)
                        }
                    }
                    
                    Text(budget.title)
                        .foregroundColor(.primaryText)
                        .font(.titleFont(size: 16))
                        .kerning(-0.4)
                }
                                
                Text(amountText)
                    .foregroundColor(budget.type == .income ? .green : .red)
                    .font(.bodyFont(size: 34))
                    .kerning(-0.4)
            }
            .padding()
        }
        .frame(minHeight: 171)
    }
    
    private var amountText: String {
        let sign = budget.type == .income ? "+" : "-"
        return "\(sign)$\(budget.amount)"
    }
}

#Preview {
    ZStack {
        Color.background.ignoresSafeArea()
        ScrollView {
            HStack {
                BudgetCellView(budget: Budget.getMockData(), action: {})
                BudgetCellView(budget: Budget.getMockData(), action: {})
            }
        }
        .padding()
    }
}
