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
    @Published var isOnboardingCompleted = false
    @Published var initialURL: URL?
    
    init() {
        fetchInitialURL()
    }
    
    func stepHandler() -> Bool {
        if currentStep < source.count - 1 {
            self.currentStep += 1
            return false
        } else {
            self.isOnboardingCompleted = true
            return true
        }
    }
    
    func requestReview() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
    
    private func fetchInitialURL() {
        RemoteConfigService.shared.getFirebaseData(field: APIConfiguration.shared.initialUrlName, dataType: .string) { [weak self] result in
            DispatchQueue.main.async {
                if let urlString = result as? String, let url = URL(string: urlString) {
                    self?.initialURL = url
                } else {
                    // Установка значения по умолчанию, если URL не найден
                    self?.initialURL = URL(string: "https://google.com")
                }
            }
        }
    }
}
