//
//  ArticlesView.swift
//  BoardAppsTest
//
//  Created by Alex on 09.02.2024.
//

import SwiftUI

struct ArticlesView: View {
    @StateObject var vm = ArticlesViewModel()
    @State private var isAdding = false
    @State private var showingDetails = false
    @State private var selectedArticle: Article?
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()
                
                if vm.articles.isEmpty {
                    EmptyView(
                        title: "No articles added",
                        subtitle: "Add an article with the plus icon above"
                    )
                } else {
                    ScrollView(showsIndicators: false) {
                        LazyVStack {
                            ForEach(vm.articles) { article in
                                ArticleCellView(article: article)
                                    .onTapGesture {
                                        selectedArticle = article
                                        showingDetails.toggle()
                                    }
                            }
                            .padding([.leading, .trailing])
                        }
                    }
                }
            }
            .navigationTitle("Articles")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ToolbarButtonView(image: .icAdd) {
                        isAdding.toggle()
                    }
                }
            }
            .sheet(isPresented: $isAdding) {
                NavigationView {
                    AddArticleView(viewModel: vm)
                }
            }
            .sheet(item: $selectedArticle) { article in
                NavigationView {
                    ArticleDetailView(article: article) {
                        vm.deleteArticle(article: article)
                    }
                }
            }
        }
    }
}

#Preview {
    ArticlesView()
        .preferredColorScheme(.dark)
}
