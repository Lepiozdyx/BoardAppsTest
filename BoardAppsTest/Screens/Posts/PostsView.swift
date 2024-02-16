//
//  PostsView.swift
//  BoardAppsTest
//
//  Created by Alex on 15.02.2024.
//

import SwiftUI

struct PostsView: View {
    @StateObject var vm = PostsViewModel()
    @State private var isAdding = false
    @State private var showingDetails = false
    @State private var selectedPost: Post?
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()
                
                if vm.posts.isEmpty {
                    EmptyView(
                        title: "No posts added",
                        subtitle: "You don't have any posts added"
                    )
                } else {
                    ScrollView(showsIndicators: false) {
                        LazyVStack {
                            ForEach(vm.posts) { post in
                                PostsCellView(post: post)
                                    .onTapGesture {
                                        selectedPost = post
                                        showingDetails.toggle()
                                    }
                            }
                            .padding([.leading, .trailing])
                        }
                    }
                }
            }
            .navigationTitle("Posts")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ToolbarButtonView(image: .icAdd) {
                        isAdding.toggle()
                    }
                }
            }
            .sheet(isPresented: $isAdding) {
                NavigationView {
                    AddPostView(viewModel: vm)
                }
            }
            .sheet(item: $selectedPost) { post in
                NavigationView {
                    PostDetailView(post: post) {
                        vm.deletePost(post: post)
                    }
                }
            }
        }
    }
}

#Preview {
    PostsView()
        .preferredColorScheme(.dark)
}
