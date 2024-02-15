//
//  BudgetView.swift
//  BoardAppsTest
//
//  Created by Alex on 13.02.2024.
//

import SwiftUI

struct BudgetView: View {
    @StateObject var vm = BudgetViewModel()
    @State private var isAdding = false
    @State private var showingAlert = false
    @State private var budgetToDelete: Budget?
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()

                VStack {
                    Picker("Select type", selection: $vm.selectedType) {
                        Text("Income").tag(Budget.BudgetType.income)
                        Text("Expenses").tag(Budget.BudgetType.expense)
                    }
                    .pickerStyle(.segmented)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding([.top, .bottom])
                    
                    if vm.budgets.isEmpty {
                        switch vm.selectedType {
                        case .income:
                            EmptyView(
                                title: "No incomes added",
                                subtitle: "Add an income with the plus icon above"
                            )
                        case .expense:
                            EmptyView(
                                title: "No expenses added",
                                subtitle: "Add an expense with the plus icon above"
                            )
                        }
                    } else {
                        ScrollView(showsIndicators: false) {
                            LazyVGrid(columns: columns) {
                                ForEach(vm.filteredBudgets) { budget in
                                    BudgetCellView(budget: budget) {
                                        budgetToDelete = budget
                                        showingAlert.toggle()
                                    }
                                }
                            }
                        }
                    }
                }
                .padding([.leading, .trailing])
            }
            .navigationTitle("Budget")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        // add new income
                        Button {
                            vm.addType(type: .income)
                            isAdding.toggle()
                        } label: {
                            Label("New income", systemImage: "arrow.up")
                        }
                        
                        // add new expense
                        Button {
                            vm.addType(type: .expense)
                            isAdding.toggle()
                        } label: {
                            Label("New expense", systemImage: "arrow.down")
                        }
                    } label: {
                        Image(.icAdd)
                    }
                }
            }
            .sheet(isPresented: $isAdding) {
                NavigationView {
                    AddBudgetView(viewModel: vm)
                }
            }
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Delete this item?"),
                    primaryButton: .destructive(Text("Delete")) {
                        if let budgetToDelete = budgetToDelete {
                            vm.deleteBudget(budget: budgetToDelete)
                        }
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
}

#Preview {
    BudgetView()
        .preferredColorScheme(.dark)
}
