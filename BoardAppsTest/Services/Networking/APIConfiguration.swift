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
    
    private init() {}
}
