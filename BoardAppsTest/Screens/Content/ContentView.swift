//
//  ContentView.swift
//  BoardAppsTest
//
//  Created by Alex on 08.02.2024.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = .tabBarBackground
    }
    
    var body: some View {
        TabView {
            ArticlesView()
                .tabItem {
                    Image(.icArticles)
                        .renderingMode(.template)
                    Text("Articles")
                }
            
            EventsView()
                .tabItem {
                    Image(.icEvents)
                        .renderingMode(.template)
                    Text("Events")
                }
            
            BudgetView()
                .tabItem {
                    Image(.icBudget)
                        .renderingMode(.template)
                    Text("Budget")
                }
            
            PostsView()
                .tabItem {
                    Image(.icPosts)
                        .renderingMode(.template)
                    Text("Posts")
                }
            
            SettingsView()
                .tabItem {
                    Image(.icSettings)
                        .renderingMode(.template)
                    Text("Settings")
                }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
