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
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                ContentView()
                    .preferredColorScheme(.dark)
            } else {
                OnboardingView()
            }
        }
    }
}
