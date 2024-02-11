//
//  StorageManager.swift
//  BoardAppsTest
//
//  Created by Alex on 09.02.2024.
//

import Foundation

final class StorageManager {
    
    // MARK: save / load / delete methods
    func save<T: Codable>(_ object: T, key: String) {
        do {
            let data = try JSONEncoder().encode(object)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("\(T.self) saving failed: \(error)")
        }
    }
    
    func load<T: Codable>(key: String) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        do {
            let object = try JSONDecoder().decode(T.self, from: data)
            return object
        } catch {
            print("\(T.self) loading failed: \(error)")
            return nil
        }
    }
    
    func remove(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
