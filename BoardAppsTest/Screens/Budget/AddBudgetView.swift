//
//  AddBudgetView.swift
//  BoardAppsTest
//
//  Created by Alex on 14.02.2024.
//

import SwiftUI

struct AddBudgetView: View {
    @ObservedObject var viewModel: BudgetViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var date: Date?
    @State private var amountText = ""
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.background.ignoresSafeArea()
            
            VStack(spacing: 22) {
                CustomTextField(value: $title, placeholder: "Title")
                
                HStack {
                    CustomDatePicker(date: $date)
                    
                    Spacer()
                    
                    CustomTextField(value: $amountText, placeholder: "Sum")
                        .keyboardType(.decimalPad)
//                        .frame(width: 171)
                }
                
                Spacer()
            }
            .padding()
            
            ActionButtonView(name: "Add") {
                viewModel.addBudget(
                    title: title,
                    date: date ?? Date(),
                    amount: Double(amountText) ?? 0,
                    type: viewModel.selectedType
                )
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .disabled(title.isEmpty||amountText.isEmpty)
        }
        .navigationTitle(viewModel.selectedType == .income ? "New income" : "New expense")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButtonView {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        AddBudgetView(viewModel: BudgetViewModel())
            .preferredColorScheme(.dark)
    }
}
