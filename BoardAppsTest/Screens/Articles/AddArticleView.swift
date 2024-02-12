//
//  AddArticleView.swift
//  BoardAppsTest
//
//  Created by Alex on 09.02.2024.
//

import SwiftUI

struct AddArticleView: View {
    @ObservedObject var viewModel: ArticlesViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var headline: String = ""
    @State private var selectedCategory: String = ""
    @State private var status: String = "Status"
    @State private var publisher: String = ""
    @State private var content: String = ""
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.background.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 22) {
                    CustomTextField(value: $headline, placeholder: "Headline")
                        .padding([.leading, .trailing, .top])
                    
                    CategoryButtonsScrollView(selectedCategory: selectedCategory) { category in
                        selectedCategory = category
                    }
                    
                    CustomPicker(status: $status)
                        .padding([.leading, .trailing])
                    
                    CustomTextField(value: $publisher, placeholder: "Publisher")
                        .padding([.leading, .trailing])
                    
                    #warning("Create custom TextEditor")
                    CustomTextField(value: $content, placeholder: "Article text")
                        .padding([.leading, .trailing])
                }
            }
            
            ActionButtonView(name: "Add") {
                viewModel.addArticle(
                    title: headline,
                    category: selectedCategory,
                    status: status,
                    publisher: publisher,
                    content: content
                )
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .disabled(headline.isEmpty)
        }
        .navigationTitle("New articles")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButtonView {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        AddArticleView(viewModel: ArticlesViewModel())
            .preferredColorScheme(.dark)
    }
}
