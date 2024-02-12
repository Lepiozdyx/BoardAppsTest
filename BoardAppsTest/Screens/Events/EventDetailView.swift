//
//  EventDetailView.swift
//  BoardAppsTest
//
//  Created by Alex on 12.02.2024.
//

import SwiftUI

struct EventDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAlert = false
    let event: Event
    let deleteAction: () -> Void
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            VStack {
                HStack {
                    Text(event.location)
                        .foregroundColor(.secondaryText)
                        .font(.bodyFont(size: 15))
                        .kerning(-0.4)
                    
                    + Text(" /").foregroundColor(.secondaryText)
                    
                    Text(event.date.formatted())
                        .foregroundColor(.secondaryText)
                        .font(.bodyFont(size: 15))
                        .kerning(-0.4)
                    
                    Spacer()
                    
                    CategoryButtonView(category: event.category, isSelected: true, action: {})
                }
                .padding([.leading, .trailing, .top])
                
                HStack(alignment: .top, spacing: 28) {
                    VStack {
                        Text(event.teamOneScore)
                            .foregroundColor(.primaryText)
                            .font(.titleFont(size: 68))
                        
                        Text(event.teamOne)
                            .foregroundColor(.primaryText)
                            .font(.bodyFont(size: 17))
                    }
                    
                    Text(":")
                        .foregroundColor(.primaryText)
                        .font(.titleFont(size: 68))
                    
                    VStack {
                        Text(event.teamTwoScore)
                            .foregroundColor(.primaryText)
                            .font(.titleFont(size: 68))
                        
                        Text(event.teamTwo)
                            .foregroundColor(.primaryText)
                            .font(.bodyFont(size: 17))
                    }
                }
                .padding([.leading, .trailing])
                
                Spacer()
            }
        }
        .navigationTitle(event.eventTitle)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButtonView {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                ToolbarButtonView(image: .icBin) {
                    showingAlert.toggle()
                }
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Delete the event?"),
                primaryButton: .destructive(Text("Delete")) {
                    deleteAction()
                    presentationMode.wrappedValue.dismiss()
                },
                secondaryButton: .cancel()
            )
        }
    }
}

#Preview {
    NavigationView {
        EventDetailView(event: Event.getMockData(), deleteAction: {})
            .preferredColorScheme(.dark)
    }
}
