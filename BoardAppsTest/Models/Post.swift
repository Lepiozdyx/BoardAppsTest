//
//  Post.swift
//  BoardAppsTest
//
//  Created by Alex on 15.02.2024.
//

import Foundation

struct Post: Identifiable, Codable {
    var id: UUID
    var title: String
    var text: String
    var date: Date
    
    init(id: UUID = UUID(), title: String, text: String, date: Date) {
        self.id = id
        self.title = title
        self.text = text
        self.date = date
    }
    
    static func getMockData() -> Post {
        Post(
            title: "Lorem ipsum dolor sit amet",
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            date: Date()
        )
    }
}
