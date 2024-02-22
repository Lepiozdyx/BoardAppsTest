//
//  RemoteConfigService.swift
//  BoardAppsTest
//
//  Created by Alex on 21.02.2024.
//

import Foundation
import Firebase

final class RemoteConfigService {
    enum DataType: CaseIterable {
        case bool, url, string
    }
    
    static let shared = RemoteConfigService()
    
    private init() {}
    
    func getFirebaseData(field: String, dataType: DataType, completion: @escaping (Any) -> Void) {
        print("RemoteConfigService: Запрашиваем данные для поля \(field).")
        let config = RemoteConfig.remoteConfig()
        
        config.configSettings.minimumFetchInterval = 300
        config.fetchAndActivate{ _, _ in
            if dataType == .bool {
                completion(config.configValue(forKey: field).boolValue)
            } else if dataType == .url {
                guard let url_string = config.configValue(forKey: field).stringValue, let url = URL(string: url_string) else {
                    return
                }
                completion(url)
            } else if dataType == .string {
                completion(config.configValue(forKey: field).stringValue ?? "")
            }
        }
    }
    
    func checkLaunchDate(completion: @escaping (Bool) -> Void) {
        print("RemoteConfigService: Проверяем дату запуска.")
        let remoteConfig = RemoteConfig.remoteConfig()
        remoteConfig.fetchAndActivate { status, error in
            guard error == nil else {
                print("RemoteConfigService: Ошибка при получении конфигурации: \(String(describing: error))")
                return completion(true) // По умолчанию продолжаем без серверного запроса
            }
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            if let dateString = remoteConfig[APIConfiguration.shared.remoteConfigKey].stringValue,
               let lastDate = formatter.date(from: dateString) {
                print("RemoteConfigService: Получена дата из Remote Config: \(dateString), интерпретированная как: \(lastDate)")
                
                let currentDate = Date()
                print("RemoteConfigService: Текущая дата: \(formatter.string(from: currentDate))")
                
                if currentDate <= lastDate {
                    print("RemoteConfigService: Текущая дата меньше или равна lastDate. Продолжаем без запроса.")
                    completion(true) // Продолжаем без запроса
                } else {
                    print("RemoteConfigService: Текущая дата больше lastDate. Производим запрос.")
                    completion(false) // Производим запрос
                }
            } else {
                print("RemoteConfigService: Не удалось получить или интерпретировать дату из Remote Config.")
                completion(false) // В случае сомнений производим запрос
            }
        }
    }
}
