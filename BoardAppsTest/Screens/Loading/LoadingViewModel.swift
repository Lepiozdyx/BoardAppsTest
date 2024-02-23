//
//  LoadingViewModel.swift
//  BoardAppsTest
//
//  Created by Alex on 21.02.2024.
//

import Foundation

final class LoadingViewModel: ObservableObject {
    @Published var shouldShowOnboarding: Bool?
    
    init() {
        checkLaunchDate()
    }
    
    private func checkStatus() {
        let deviceData = DeviceInfo.collectData()
        
        NetworkManager.networkManager.postRequest(endpoint: deviceData) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    self?.shouldShowOnboarding = success
                case .failure(let error):
                    print(error.localizedDescription)
                    self?.checkIsDeadParameter()
                }
            }
        }
    }
    
    private func checkLaunchDate() {        
        RemoteConfigService.shared.checkLaunchDate { [weak self] noRequest in
            DispatchQueue.main.async {
                if noRequest {
                    self?.shouldShowOnboarding = true
                } else {
                    self?.checkStatus()
                }
            }
        }
    }
    
    private func checkIsDeadParameter() {
        RemoteConfigService.shared.getFirebaseData(field: APIConfiguration.shared.responceWaitingParameterName, dataType: .bool) { [weak self] result in
            DispatchQueue.main.async {
                if let isDead = result as? Bool {
                    self?.shouldShowOnboarding = !isDead
                } else {
                    self?.shouldShowOnboarding = true
                }
            }
        }
    }
}
