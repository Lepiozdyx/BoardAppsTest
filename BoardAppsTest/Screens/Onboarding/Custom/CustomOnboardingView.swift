//
//  CustomOnboardingView.swift
//  BoardAppsTest
//
//  Created by Alex on 21.02.2024.
//

import SwiftUI

struct CustomOnboardingView: View {
    @StateObject var vm = CustomOnboardingViewModel()
    @Binding var isOnboarding: Bool
    
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
                .onChange(of: vm.currentStep) { newValue in
                    if newValue == 1 {
                        vm.requestReview()
                    } else if newValue == 2 {
                        vm.requestNotifications()
                    }
                }
                
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
                            isOnboarding = true
                        }
                    }
                    .padding(.top)
                }
                .padding(.horizontal)
            }
        }
        .animation(.default)
        .background(Color.black.ignoresSafeArea())
    }
}

#Preview {
    CustomOnboardingView(isOnboarding: .constant(false))
}
