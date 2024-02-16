//
//  OnboardingView.swift
//  BoardAppsTest
//
//  Created by Alex on 08.02.2024.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var vm = OnboardingViewModel()
    @AppStorage("isOnboarding") var isOnboarding = false
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            VStack {
                TabView(selection: $vm.currentStep) {
                    ForEach(vm.source.indices, id: \.self) { index in
                        Image(vm.source[index].image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: .infinity, alignment: .top)
                            .tag(index)
                            .ignoresSafeArea()
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .ignoresSafeArea(edges: .top)
                
                VStack(spacing: 10) {
                    Text(vm.source[vm.currentStep].title)
                        .foregroundColor(.primaryText)
                        .font(.titleFont(size: 28))
                        .kerning(-0.4)
                    
                    Text(vm.source[vm.currentStep].description)
                        .foregroundColor(.secondaryText)
                        .font(.bodyFont(size: 17))
                        .kerning(-0.4)
                    
                    ActionButtonView(name: "Next") {
                        if vm.stepHandler() {
                            isOnboarding.toggle()
                        }                        
                    }
                }
                .padding(.horizontal)
            }
        }
        .animation(.default)
        .background(Color.black.ignoresSafeArea())
    }
}

#Preview {
    OnboardingView()
}
