//
//  CustomPicker.swift
//  BoardAppsTest
//
//  Created by Alex on 09.02.2024.
//

import SwiftUI

struct CustomPicker: View {
    @Binding var status: String
    let statuses = ["Writing", "Sent", "Published", "Archive"]
    
    var body: some View {
        Menu {
            Picker("Status", selection: $status) {
                ForEach(statuses, id: \.self) { status in
                    Text(status).tag(status)
                }
            }
        } label: {
            HStack {
                Text(status)
                    .foregroundColor(status == "Status" ? .secondaryText.opacity(0.6) : .primaryText)
                
                Image(systemName: status == "Status" ? "chevron.down" : "chevron.up")
                    .foregroundColor(status == "Status" ? .secondaryText.opacity(0.6) : .primaryText)
                
                Spacer()
            }
            .padding()
            .frame(height: 62)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(status.isEmpty || status == "Status" ? .secondaryText : .accentColor, lineWidth: 1)
            )
        }
        .animation(.default, value: status)
    }
}

#Preview {
    CustomPicker(status: .constant("Status"))
        .preferredColorScheme(.dark)
}
