//
//  LoadingView.swift
//  BoardAppsTest
//
//  Created by Alex on 20.02.2024.
//

import SwiftUI

struct LoadingView: View {
    @State private var isDataSent = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            VStack(spacing: 250) {
                Image(.logo)
                
                ProgressView()
                    .progressViewStyle(.linear)
                    .frame(width: 190)
                
                Button(action: sentData) {
                    Text("Go")
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Ответ сервера"),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
            .padding()
        }
    }
    
    func sentData() {
        let deviceData = DeviceInfo.collectData()
        
        NetworkManager.networkManager.postRequest(endpoint: deviceData) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    isDataSent = success
                    alertMessage = success ? "Данные успешно отправлены и обработаны сервером." : "Сервер вернул отрицательный ответ."
                case .failure(let error):
                    alertMessage = "Ошибка при отправке данных: \(error.localizedDescription)"
                }
                showAlert = true
            }
        }
    }
}

#Preview {
    LoadingView()
}

class AppState: ObservableObject {
    @Published var isInitialized = false
    
    func initializeApp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                self.isInitialized = true
            }
        }
    }
}
