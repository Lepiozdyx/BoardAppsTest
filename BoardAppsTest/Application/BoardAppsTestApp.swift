//
//  BoardAppsTestApp.swift
//  BoardAppsTest
//
//  Created by Alex on 08.02.2024.
//

import SwiftUI

@main
struct BoardAppsTestApp: App {
    @AppStorage("isOnboarding") var isOnboarding = false
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            if appState.isInitialized {
                ContentView()
                    .preferredColorScheme(.dark)
            } else {
                LoadingView()
                    .onAppear {
                        appState.initializeApp()
                    }
            }
//            if isOnboarding {
//                ContentView()
//                    .preferredColorScheme(.dark)
//            } else {
//                OnboardingView()
//            }
        }
    }
}
