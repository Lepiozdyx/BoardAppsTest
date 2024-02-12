//
//  ArticleDetailView.swift
//  BoardAppsTest
//
//  Created by Alex on 10.02.2024.
//

import SwiftUI

struct ArticleDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAlert = false
    let article: Article
    let deleteAction: () -> Void
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                HStack {
                    Text(article.status)
                        .foregroundColor(.primaryText)
                        .font(.titleFont(size: 17))
                        .kerning(-0.4)
                    
                    Spacer()
                    CategoryButtonView(category: article.category, isSelected: true, action: {})
                }
                
                Text(article.publisher)
                    .foregroundColor(.secondaryText)
                    .font(.titleFont(size: 17))
                    .kerning(-0.4)
                
                ScrollView {
                    Text(article.content)
                        .foregroundColor(.primaryText)
                        .font(.bodyFont(size: 17))
                        .kerning(-0.4)
                }
            }
            .padding()
        }
        .navigationTitle(article.title)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButtonView {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                ToolbarButtonView(image: .icBin) {
                    showingAlert.toggle()
                }
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Delete an article?"),
                primaryButton: .destructive(Text("Delete")) {
                    deleteAction()
                    presentationMode.wrappedValue.dismiss()
                },
                secondaryButton: .cancel()
            )
        }
    }
}

#Preview {
    NavigationView {
        ArticleDetailView(article: Article.getMockData(), deleteAction: {})
            .preferredColorScheme(.dark)
    }
}
