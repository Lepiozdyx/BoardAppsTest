//
//  BackButtonView.swift
//  BoardAppsTest
//
//  Created by Alex on 09.02.2024.
//

import SwiftUI

struct BackButtonView: View {
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(.icBackarrow)
                .foregroundColor(.primaryText)
        }
    }
}

#Preview {
    BackButtonView(action: {})
}
