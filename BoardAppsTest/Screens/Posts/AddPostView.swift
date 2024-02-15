//
//  AddPostView.swift
//  BoardAppsTest
//
//  Created by Alex on 15.02.2024.
//

import SwiftUI

struct AddPostView: View {
    @ObservedObject var viewModel: PostsViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var date: Date?
    @State private var text = ""
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.background.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 22) {
                    CustomTextField(value: $title, placeholder: "Name post")
                        .padding([.leading, .trailing, .top])
                    
                    CustomDatePicker(date: $date)
                        .padding([.leading, .trailing])
                    
                    CustomTextEditor(title: "Text", text: $text)
                        .padding([.leading, .trailing])
                }
            }
            
            ActionButtonView(name: "Add") {
                viewModel.addPost(
                    title: title,
                    text: text,
                    date: date ?? Date()
                )
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .disabled(title.isEmpty||text.isEmpty)
        }
        .navigationTitle("New post")
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
        AddPostView(viewModel: PostsViewModel())
            .preferredColorScheme(.dark)
    }
}
