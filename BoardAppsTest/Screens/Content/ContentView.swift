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
//        NavigationView {
            TabView {
                ArticlesView()
                    .tabItem {
                        Image(.icArticles)
                        Text("Articles")
    //                        .renderingMode(.template)
                    }
                EventsView()
                    .tabItem {
                        Image(.icEvents)
                        Text("Events")
    //                        .renderingMode(.template)
                    }
                
                BudgetView()
                    .tabItem {
                        Image(.icBudget)
                        Text("Budget")
    //                        .renderingMode(.template)
                    }
                
                Text("Posts")
                    .tabItem {
                        Image(.icPosts)
                        Text("Posts")
    //                        .renderingMode(.template)
                    }
                
                Text("Settings")
                    .tabItem {
                        Image(.icSettings)
                        Text("Settings")
    //                        .renderingMode(.template)
                    }
            }
//        }
    }
}

#Preview {
    ContentView()
}
