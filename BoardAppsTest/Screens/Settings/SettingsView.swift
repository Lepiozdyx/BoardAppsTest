//
//  SettingsView.swift
//  BoardAppsTest
//
//  Created by Alex on 15.02.2024.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel = SettingsViewModel()
    @State private var showingResetConfirmation = false
    @State private var showingShareSheet = false
    @State private var showingUsageProfile = false
    let items: [Any] = [URL(string: "https://apps.apple.com/us/app/control-all-in-one/id6478009366")!]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()
                
                VStack {
                    SettingsButtonView(
                        icon: .icShare,
                        title: "Share app",
                        background: .cardBackground
                    ) {
                        showingShareSheet.toggle()
                    }
                    
                    SettingsButtonView(
                        icon: .icStar,
                        title: "Rate app",
                        background: .cardBackground
                    ) {
                        viewModel.requestReview()
                    }
                    
                    SettingsButtonView(
                        icon: .icDocs,
                        title: "Usage profile",
                        background: .cardBackground
                    ) {
                        showingUsageProfile.toggle()
                    }
                    
                    SettingsButtonView(
                        icon: .icResetarrows,
                        title: "Reset progress",
                        background: .reset
                    ) {
                        showingResetConfirmation.toggle()
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Settings")
            .actionSheet(isPresented: $showingResetConfirmation) {
                ActionSheet(
                    title: Text("Reset Confirmation"),
                    message: Text("Your progress will be permanently reset. Do you really want to delete all data?"),
                    buttons: [
                        .destructive(Text("Reset"), action: viewModel.deleteAllContent),
                        .cancel()
                    ]
                )
            }
            .sheet(isPresented: $showingShareSheet) {
                ShareSheetView(items: items)
            }
            .sheet(isPresented: $showingUsageProfile) {
                NavigationView {
                    UsageProfileView()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
        .preferredColorScheme(.dark)
}
