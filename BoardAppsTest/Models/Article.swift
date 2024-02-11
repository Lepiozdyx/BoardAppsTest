//
//  Article.swift
//  BoardAppsTest
//
//  Created by Alex on 09.02.2024.
//

import Foundation

struct Article: Identifiable, Codable {
    var id: UUID
    var title: String
    var category: String
    var status: String
    var publisher: String
    var content: String

    init(id: UUID = UUID(), title: String, category: String, status: String, publisher: String, content: String) {
        self.id = id
        self.title = title
        self.category = category
        self.status = status
        self.publisher = publisher
        self.content = content
    }
    
    static func getMockData() -> Article {
        Article(
            title: "How Falcons stay on the top after 15 years",
            category: "basketball",
            status: "Published",
            publisher: "NYTimes",
            content: "How Falcons stay on the top after 15 years. How Falcons stay on the top after 15 years"
        )
    }
}

