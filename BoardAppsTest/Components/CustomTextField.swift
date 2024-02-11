//
//  CustomTextField.swift
//  BoardAppsTest
//
//  Created by Alex on 09.02.2024.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var value: String
    let placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $value)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(value.isEmpty ? .secondaryText: .accentColor, lineWidth: 1)
                    .frame(height: 62)
            )
    }
}

#Preview {
    CustomTextField(value: .constant("Headline"), placeholder: "Headline")
        .preferredColorScheme(.dark)
}
