//
//  OnboardingView.swift
//  BoardAppsTest
//
//  Created by Alex on 08.02.2024.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var vm = OnboardingViewModel()
    // флаг для определения, закончен ли онбординг
    // @Binding var isOnboardingFinished: Bool
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                TabView(selection: $vm.currentStep) {
                    ForEach(vm.source.indices, id: \.self) { index in
                        Image(vm.source[index].image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width)
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(height: geometry.size.height / 2)
                .ignoresSafeArea(edges: .top)
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
            }
            .padding(.horizontal)
            
            Spacer()
            
            ActionButtonView(name: "Next") {
                vm.stepHandler()
            }
            .padding()
        }
        .animation(.default)
        .background(Color.black.ignoresSafeArea())
    }
}

#Preview {
    OnboardingView()
}
