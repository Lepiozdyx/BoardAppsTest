//
//  OnboardingViewModel.swift
//  BoardAppsTest
//
//  Created by Alex on 08.02.2024.
//

import SwiftUI

final class OnboardingViewModel: ObservableObject {
    @Published var source = Onboarding.getStep()
    @Published var currentStep = 0
    
    func stepHandler() -> Bool {
        if currentStep < source.count - 1 {
            self.currentStep += 1
            return false
        } else {
            return true
        }
    }
}
