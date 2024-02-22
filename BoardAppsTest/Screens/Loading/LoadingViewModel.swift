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
        print("LoadingViewModel: Инициализация.")
        checkLaunchDate()
    }
    
    #warning(" ")
    func checkStatus() {
        print("LoadingViewModel: Выполнение ПСЕВДОсетевого запроса.")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.shouldShowOnboarding = true // Или false для проверки
        }
    }
    
//    func checkStatus() {
//      print("LoadingViewModel: Выполнение сетевого запроса.")
//        let deviceData = DeviceInfo.collectData()
//        
//        NetworkManager.networkManager.postRequest(endpoint: deviceData) { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let success):
//                    self?.shouldShowOnboarding = success
//                case .failure(let error):
//                    print(error.localizedDescription)
//                    self?.checkIsDeadParameter()
//                }
//            }
//        }
//    }
    
    private func checkLaunchDate() {
        print("LoadingViewModel: Проверка даты через RemoteConfigService.")
        RemoteConfigService.shared.checkLaunchDate { [weak self] noRequest in
            DispatchQueue.main.async {
                if noRequest {
                    // Если текущая дата меньше lastDate, не делаем запрос
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
                    self?.shouldShowOnboarding = !isDead // Если isDead == false, выдаём 1 (true), иначе 0 (false).
                } else {
                    // В случае ошибки или если значение не найдено, установка значения по умолчанию
                    self?.shouldShowOnboarding = true
                }
            }
        }
    }
}
