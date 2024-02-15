//
//  SettingsViewModel.swift
//  BoardAppsTest
//
//  Created by Alex on 15.02.2024.
//

import Foundation
import StoreKit

final class SettingsViewModel: ObservableObject {
    private let storageManager: StorageManager
    
    init(storageManager: StorageManager = StorageManager()) {
        self.storageManager = storageManager
    }
    
    func requestReview() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
    
    func deleteAllContent() {
        storageManager.remove(key: "articles")
        storageManager.remove(key: "events")
        storageManager.remove(key: "budget")
        storageManager.remove(key: "posts")
    }
}
