//
//  NetworkManager.swift
//  BoardAppsTest
//
//  Created by Alex on 20.02.2024.
//

import Foundation

final class NetworkManager {
    static let networkManager = NetworkManager()
    
    private init() {}
    
    func postRequest(endpoint: ServerRequestProtocol, completion: @escaping (Result<Bool, Error>) -> Void) {
        
        guard let url = URL(string: endpoint.mainURL) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        // request timeout
        request.timeoutInterval = 7
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: endpoint.body, options: [])
        } catch {
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.cannotLoadFromNetwork)))
                return
            }
            
            DispatchQueue.main.async {
                do {
                    if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        if let reloadableValue = jsonObject[APIConfiguration.shared.serverResponseKey] as? Bool {
                            completion(.success(reloadableValue))
                        } else if let responseString = String(data: data, encoding: .utf8), self.isBlockValue(responseString) {
                            completion(.success(true))
                        } else {
                            completion(.success(false))
                        }
                    } else {
                        completion(.failure(URLError(.cannotParseResponse)))
                    }
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    func isBlockValue(_ value: String) -> Bool {
        return value == "1"
    }
}
