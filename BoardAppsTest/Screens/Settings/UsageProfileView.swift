//
//  UsageProfileView.swift
//  BoardAppsTest
//
//  Created by Alex on 16.02.2024.
//

import SwiftUI

struct UsageProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let privacy = URL(string: "https://docs.google.com/document/d/1vsF4jz43v-oUbRxbgjJEus5sYxK_Gw7SZ2NNJPFntok/edit")!
    let termsAndConditions = URL(string: "https://docs.google.com/document/d/1oSTHgMbjwC9ISCCJzFtJb-UVzURnc-LwNmFPT2plK4M/edit")!
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.background.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 16) {
                Spacer()
                Text("Please read the information:")
                    .foregroundColor(.secondaryText)
                
                Link("Privacy Policy", destination: privacy)
                    .font(.titleFont(size: 22))
                
                Link("Terms & Conditions", destination: termsAndConditions)
                    .font(.titleFont(size: 22))
                Spacer()
                Spacer()
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Usage profile")
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
        UsageProfileView()
            .preferredColorScheme(.dark)
    }
}
