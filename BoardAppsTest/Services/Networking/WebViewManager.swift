//
//  WebViewManager.swift
//  BoardAppsTest
//
//  Created by Alex on 22.02.2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let webView: WKWebView = createWebView()

    func makeUIView(context: Context) -> WKWebView {
        webView.navigationDelegate = context.coordinator
        context.coordinator.loadInitialURL()
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // загрузка URL обрабатывается через Coordinator
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(webView)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var webView: WKWebView
        var loadCheckTimer: Timer?

        init(_ webView: WKWebView) {
            self.webView = webView
        }

        func loadInitialURL() {
            RemoteConfigService.shared.getFirebaseData(field: "isChangeAllURL", dataType: .bool) { [weak self] result in
                if let changeForAll = result as? Bool, changeForAll {
                    self?.loadConfiguredUniversalURL()
                } else {
                    self?.loadUserSpecificURL()
                }
            }
        }

        private func loadConfiguredUniversalURL() {
            RemoteConfigService.shared.getFirebaseData(field: "url_link", dataType: .string) { [weak self] result in
                if let urlString = result as? String, let url = URL(string: urlString) {
                    DispatchQueue.main.async {
                        self?.webView.load(URLRequest(url: url))
                    }
                }
            }
        }

        private func loadUserSpecificURL() {
            let savedURLString = UserDefaults.standard.string(forKey: "lastVisitedPage")
            let urlString = savedURLString ?? "https://google.com" // Значение по умолчанию, если нет сохраненного URL
            if let url = URL(string: urlString) {
                DispatchQueue.main.async {
                    self.webView.load(URLRequest(url: url))
                }
            }
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            loadCheckTimer?.invalidate()
            // Сохранение URL последней успешно загруженной страницы
            if let url = webView.url?.absoluteString {
                UserDefaults.standard.set(url, forKey: "lastVisitedPage")
            }
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            loadCheckTimer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
                print("Страница не загрузилась в течение 5 секунд.")
                webView.stopLoading()
            }
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            loadCheckTimer?.invalidate()
            // Обработка ошибок загрузки
        }

        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            loadCheckTimer?.invalidate()
            // Обработка ошибок загрузки
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
}
