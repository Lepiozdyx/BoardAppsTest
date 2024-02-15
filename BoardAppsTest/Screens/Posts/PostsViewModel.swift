//
//  PostsViewModel.swift
//  BoardAppsTest
//
//  Created by Alex on 15.02.2024.
//

import Foundation

final class PostsViewModel: ObservableObject {
    private enum StorageKeys {
        static let postsKey = "posts"
    }
    
    @Published var posts: [Post] = []
    private let storageManager: StorageManager
    
    init(storageManager: StorageManager = StorageManager()) {
        self.storageManager = storageManager
        loadPost()
    }
    
    func addPost(title: String, text: String, date: Date) {
        let newPost = Post(title: title, text: text, date: date)
        posts.append(newPost)
        savePost()
    }
    
    func deletePost(post: Post) {
        if let index = posts.firstIndex(where: { $0.id == post.id }) {
            posts.remove(at: index)
            savePost()
        }
    }
    
    private func loadPost() {
        posts = storageManager.load(key: StorageKeys.postsKey) ?? []
    }
    
    private func savePost() {
        storageManager.save(posts, key: StorageKeys.postsKey)
    }
}
