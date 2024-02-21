//
//  ViewModel.swift
//  BoardAppsTest
//
//  Created by Alex on 21.02.2024.
//

import Foundation
import StoreKit

final class CustomOnboardingViewModel: ObservableObject {
    @Published var source = Onboarding.customStep
    @Published var currentStep = 0
    
    func stepHandler() -> Bool {
        if currentStep < source.count - 1 {
            self.currentStep += 1
            return false
        } else {
            return true
        }
    }
    
    func requestReview() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
}
