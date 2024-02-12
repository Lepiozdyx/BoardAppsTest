//
//  AddEventView.swift
//  BoardAppsTest
//
//  Created by Alex on 12.02.2024.
//

import SwiftUI

struct AddEventView: View {
    @ObservedObject var viewModel: EventsViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var teamOneName = ""
    @State private var teamTwoName = ""
    @State private var teamOneScore = ""
    @State private var teamTwoScore = ""
    @State private var selectedCategory = ""
    @State private var location = ""
    @State private var date = Date()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.background.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 22) {
                    HStack {
                        CustomTextField(value: $teamOneName, placeholder: "Team 01")
                        CustomTextField(value: $teamOneScore, placeholder: "Team score")
                            .keyboardType(.numberPad)
                    }
                    .padding([.leading, .trailing, .top])
                    
                    HStack {
                        CustomTextField(value: $teamTwoName, placeholder: "Team 02")
                        CustomTextField(value: $teamTwoScore, placeholder: "Team score")
                            .keyboardType(.numberPad)
                    }
                    .padding([.leading, .trailing])
                    
                    CategoryButtonsScrollView(selectedCategory: selectedCategory) { category in
                        selectedCategory = category
                    }
                    
                    CustomTextField(value: $location, placeholder: "Subtitle")
                        .padding([.leading, .trailing])
                    
                    #warning("Create custom DatePicker")
                    DatePicker("Enter the date:", selection: $date, displayedComponents: .date)
                        .padding([.leading, .trailing])
                }
            }
            
            ActionButtonView(name: "Add") {
                viewModel.addEvent(
                    teamOne: teamOneName,
                    teamTwo: teamTwoName,
                    teamOneScore: teamOneScore,
                    teamTwoScore: teamTwoScore,
                    category: selectedCategory,
                    location: location,
                    date: date
                )
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .disabled(teamOneName.isEmpty||teamTwoName.isEmpty||teamOneScore.isEmpty||teamTwoScore.isEmpty||selectedCategory.isEmpty||location.isEmpty)
        }
        .navigationTitle("New event")
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
        AddEventView(viewModel: EventsViewModel())
            .preferredColorScheme(.dark)
    }
}
