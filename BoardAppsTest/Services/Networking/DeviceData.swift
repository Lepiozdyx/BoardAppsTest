//
//  DeviceData.swift
//  BoardAppsTest
//
//  Created by Alex on 20.02.2024.
//

import Foundation

protocol ServerRequestProtocol {
    var mainURL: String { get }
    var method: String { get }
    var body: [String: Any] { get }
}

struct DeviceData {
    var isVPNActive: Bool
    var deviceName: String
    var deviceModel: String
    var uniqueID: String
    var networkAddresses: [String]
    var carriers: [String]
    var iosVersion: String
    var language: String
    var timeZone: String
    var isCharging: Bool
    var memoryInfo: String
    var installedApps: [String: Bool]
    var batteryLevel: Double
    var inputLanguages: [String]
    var region: String
    var usesMetricSystem: Bool
    var isFullyCharged: Bool
}

// MARK: - DeviceData extension
extension DeviceData: ServerRequestProtocol {
    var mainURL: String {
        APIConfiguration.shared.server
    }
    
    var method: String {
        "POST"
    }
    
    var body: [String: Any] {
        let userData: [String: Any] = [
            "vivisWork": isVPNActive,
            "gfdokPS": deviceName,
            "gdpsjPjg": deviceModel,
            "poguaKFP": uniqueID,
            "gpaMFOfa": networkAddresses,
            "gciOFm": carriers,
            "bcpJFs": iosVersion,
            "GOmblx": language,
            "G0pxum": timeZone,
            "Fpvbduwm": isCharging,
            "Fpbjcv": memoryInfo,
            "bvoikOGjs": installedApps,
            "gfpbvjsoM": batteryLevel,
            "gfdosnb": inputLanguages,
            "bpPjfns": region,
            "biMpaiuf": usesMetricSystem,
            "oahgoMAOI": isFullyCharged,
            "KDhsd": false,
            "StwPp": false
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: userData, options: .fragmentsAllowed)
        let base64String = jsonData?.base64EncodedString() ?? ""
        
        return ["ud": base64String]
    }
}
