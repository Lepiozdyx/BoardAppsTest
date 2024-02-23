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
        let remoteConfig = RemoteConfig.remoteConfig()
        remoteConfig.fetchAndActivate { status, error in
            guard error == nil else {
                return completion(true)
            }
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            if let dateString = remoteConfig[APIConfiguration.shared.remoteConfigKey].stringValue,
               let lastDate = formatter.date(from: dateString) {
                
                let currentDate = Date()
                
                if currentDate <= lastDate {
                    completion(true)
                } else {
                    completion(false)
                }
            } else {
                completion(false)
            }
        }
    }
}
