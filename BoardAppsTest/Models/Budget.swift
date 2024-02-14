//
//  Budget.swift
//  BoardAppsTest
//
//  Created by Alex on 13.02.2024.
//

import Foundation

struct Budget: Identifiable, Codable {
    enum BudgetType: String, Codable {
        case income = "Income"
        case expense = "Expense"
    }
    
    var id: UUID
    var title: String
    var date: Date
    var amount: Double
    var type: BudgetType
    
    init(id: UUID = UUID(), title: String, date: Date, amount: Double, type: BudgetType) {
        self.id = id
        self.title = title
        self.date = date
        self.amount = amount
        self.type = type
    }
    
    static func getMockData() -> Budget {
        Budget(
            title: "Hotel room",
            date: Date(),
            amount: 499.9,
            type: .expense
        )
    }
}
