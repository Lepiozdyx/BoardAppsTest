//
//  LoadingView.swift
//  BoardAppsTest
//
//  Created by Alex on 20.02.2024.
//

import SwiftUI

struct LoadingView: View {
    @State private var downloadProgress = 0.0
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            VStack(spacing: 250) {
                Image(.logo)
                
                ProgressView(value: downloadProgress, total: 100)
                    .progressViewStyle(.linear)
                    .frame(width: 190)
            }
            .padding()
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                    withAnimation {
                        if self.downloadProgress < 100 {
                            self.downloadProgress += 2
                        } else {
                            timer.invalidate()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LoadingView()
}
