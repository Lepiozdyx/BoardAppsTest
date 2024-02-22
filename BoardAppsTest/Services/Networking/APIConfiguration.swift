//
//  APIConfiguration.swift
//  BoardAppsTest
//
//  Created by Alex on 20.02.2024.
//

import Foundation

final class APIConfiguration {
    static let shared = APIConfiguration()
    
    var server: String {
        return "https://dioklys.space/app/c0ntr01a11in0n"
    }
    
    var serverResponseKey: String {
        return "range"
    }
    
    var metrica: String {
        return "33f72c54-7342-4a44-8539-f11874238c42"
    }
    
    var apphud: String {
        return "app_R3Zf8goy4MwPKaYzcwebvu3zUP2Rfn"
    }
    
    var remoteConfigKey: String {
        return "lastDate"
    }
    
    private init() {}
}
