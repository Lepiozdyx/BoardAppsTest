//
//  BudgetViewModel.swift
//  BoardAppsTest
//
//  Created by Alex on 13.02.2024.
//

import Foundation

final class BudgetViewModel: ObservableObject {
    private enum StorageKeys {
        static let budgetKey = "budget"
    }
    
    @Published var budgets: [Budget] = []
    @Published var selectedType: Budget.BudgetType = .income
    private let storageManager: StorageManager
    
    var filteredBudgets: [Budget] {
        budgets.filter { $0.type == selectedType }
    }
    
    init(storageManager: StorageManager = StorageManager()) {
        self.storageManager = storageManager
        loadBudget()
        
        // if the budgets array is empty, add mock data for the test
//        if budgets.isEmpty {
//            addMockData()
//        }
    }
    
    // Method to start the process of adding a new budget
    func addType(type: Budget.BudgetType) {
        selectedType = type
    }
    
    func addBudget(title: String, date: Date, amount: Double, type: Budget.BudgetType) {
        let newBudget = Budget(title: title, date: date, amount: amount, type: type)
        budgets.append(newBudget)
        saveBudget()
    }
    
    func deleteBudget(budget: Budget) {
        budgets.removeAll { $0.id == budget.id }
        saveBudget()
    }
    
    private func loadBudget() {
        budgets = storageManager.load(key: StorageKeys.budgetKey) ?? []
    }
    
    private func saveBudget() {
        storageManager.save(budgets, key: StorageKeys.budgetKey)
    }
    
    // function for adding mock data for a test
//    private func addMockData() {
//        let mockBudgets = [
//            Budget(title: "Salary", date: Date(), amount: 4500, type: .income),
//            Budget(title: "Wife Salary", date: Date(), amount: 2000, type: .income),
//            Budget(title: "Groceries", date: Date(), amount: 150.5, type: .expense),
//            Budget(title: "Avto", date: Date(), amount: 44.99, type: .expense),
//            Budget(title: "House", date: Date(), amount: 1399.5, type: .expense),
//        ]
//        
//        budgets.append(contentsOf: mockBudgets)
//        saveBudget()
//    }
}
