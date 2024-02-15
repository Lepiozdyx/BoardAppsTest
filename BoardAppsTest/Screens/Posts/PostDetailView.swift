//
//  PostDetailView.swift
//  BoardAppsTest
//
//  Created by Alex on 15.02.2024.
//

import SwiftUI

struct PostDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAlert = false
    let post: Post
    let deleteAction: () -> Void
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.background.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text(post.date.formatted())
                    .foregroundColor(.secondaryText)
                    .kerning(-0.4)
                
                ScrollView(showsIndicators: false) {
                    Text(post.text)
                        .foregroundColor(.primaryText)
                        .font(.bodyFont(size: 17))
                        .kerning(-0.4)
                }
            }
            .padding()
        }
        .navigationTitle(post.title)
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
                title: Text("Delete post?"),
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
        PostDetailView(post: Post.getMockData(), deleteAction: {})
            .preferredColorScheme(.dark)
    }
}
