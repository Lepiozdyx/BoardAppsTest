//
//  RootView.swift
//  BoardAppsTest
//
//  Created by Alex on 21.02.2024.
//

import SwiftUI

struct RootView: View {
    @StateObject private var vm = LoadingViewModel()
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted = false
    
    var body: some View {
        ZStack {
            if let shouldShowOnboarding = vm.shouldShowOnboarding {
                if shouldShowOnboarding {
                    if isOnboardingCompleted {
                        ContentView()
                            .preferredColorScheme(.dark)
                    } else {
                        OnboardingView(isOnboarding: $isOnboardingCompleted)
                    }
                } else {
                    CustomOnboardingView()
                }
            } else {
                LoadingView(vm: vm)
            }
        }
    }
}

#Preview {
    RootView()
}
