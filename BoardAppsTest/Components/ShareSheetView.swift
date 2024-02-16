//
//  ShareSheetView.swift
//  BoardAppsTest
//
//  Created by Alex on 15.02.2024.
//

import SwiftUI

struct ShareSheetView: UIViewControllerRepresentable {
    var items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}
