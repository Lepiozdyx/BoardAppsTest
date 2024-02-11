//
//  ArticlesViewModel.swift
//  BoardAppsTest
//
//  Created by Alex on 09.02.2024.
//

import Foundation

final class ArticlesViewModel: ObservableObject {
    private enum StorageKeys {
        static let articlesKey = "articles"
    }
    
    @Published var articles: [Article] = []
    private let storageManager: StorageManager
    
    init(storageManager: StorageManager = StorageManager()) {
        self.storageManager = storageManager
        loadArticle()
    }
    
    func addArticle(title: String, category: String, status: String, publisher: String, content: String) {
        let newArticle = Article(title: title, category: category, status: status, publisher: publisher, content: content)
        articles.append(newArticle)
        saveArticle()
    }
    
    func deleteArticle(article: Article) {
        if let index = articles.firstIndex(where: { $0.id == article.id }) {
            articles.remove(at: index)
            saveArticle()
        }
    }
    
    private func loadArticle() {
        if let loadedArticles = storageManager.load(key: StorageKeys.articlesKey) as [Article]?{
            articles = loadedArticles
        }
    }
    
    private func saveArticle() {
        storageManager.save(articles, key: StorageKeys.articlesKey)
    }
}
