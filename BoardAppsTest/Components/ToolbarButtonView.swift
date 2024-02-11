//
//  ToolbarButtonView.swift
//  BoardAppsTest
//
//  Created by Alex on 09.02.2024.
//

import SwiftUI

struct ToolbarButtonView: View {
    let image: ImageResource
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(image)
        }
    }
}

#Preview {
    ToolbarButtonView(image: .icAdd, action: {})
}
