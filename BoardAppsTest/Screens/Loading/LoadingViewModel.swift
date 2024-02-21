//
//  LoadingViewModel.swift
//  BoardAppsTest
//
//  Created by Alex on 21.02.2024.
//

import Foundation

final class LoadingViewModel: ObservableObject {
    @Published var shouldShowOnboarding: Bool?
    
    #warning(" ")
    func checkStatus() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.shouldShowOnboarding = true // Или false для проверки
        }
    }
    
//    func checkStatus() {
//        let deviceData = DeviceInfo.collectData()
//        
//        NetworkManager.networkManager.postRequest(endpoint: deviceData) { result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let success):
//                    print("Responce: \(success)")
//                    self.shouldShowOnboarding = success
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
//        }
//    }
}
