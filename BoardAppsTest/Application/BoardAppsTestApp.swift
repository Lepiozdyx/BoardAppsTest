//
//  BoardAppsTestApp.swift
//  BoardAppsTest
//
//  Created by Alex on 08.02.2024.
//

import SwiftUI
import ApphudSDK
import OneSignalFramework
import YandexMobileMetrica
import Firebase

@main
struct BoardAppsTestApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: APIConfiguration.shared.apphud)
        
        OneSignal.initialize(APIConfiguration.shared.onesignal, withLaunchOptions: launchOptions)
        OneSignal.login(Apphud.userID())
        
        let configuration = YMMYandexMetricaConfiguration(apiKey: APIConfiguration.shared.metrica)
        YMMYandexMetrica.activate(with: configuration!)
        
        FirebaseApp.configure()
        
        return true
    }
}
