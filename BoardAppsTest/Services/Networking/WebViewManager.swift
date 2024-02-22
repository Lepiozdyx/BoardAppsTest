//
//  WebViewManager.swift
//  BoardAppsTest
//
//  Created by Alex on 22.02.2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url: URL
    let webView: WKWebView = createWebView()
    
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
    func dismantleUIView(_ uiView: WKWebView, coordinator: ()) {
        if let url = uiView.url {
            WebView.saveLastVisitedPage(url: url)
        }
    }
}

extension WebView {
    // Создание WKWebView с настраиваемым WKWebsiteDataStore
    static func createWebView() -> WKWebView {
        let webViewConfig = WKWebViewConfiguration()
        webViewConfig.websiteDataStore = .default() // для сохранения куки и данных сессии
        return WKWebView(frame: .zero, configuration: webViewConfig)
    }
    
    // Сохранение URL последней посещённой страницы
    static func saveLastVisitedPage(url: URL) {
        UserDefaults.standard.set(url.absoluteString, forKey: "lastVisitedPage")
    }
}
