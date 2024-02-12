//
//  CustomTextEditor.swift
//  BoardAppsTest
//
//  Created by Alex on 12.02.2024.
//

import SwiftUI

struct CustomTextEditor: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.secondaryText)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 20)
            }
            UITextViewWrapper(text: $text)
                .padding(.horizontal, 16)
                .padding(.vertical, 20)
                .frame(minHeight: 62)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(text.isEmpty ? .secondaryText: .accentColor, lineWidth: 1)
                )
        }
    }
}

#Preview {
    CustomTextEditor(text: .constant(""), placeholder: "Text")
        .preferredColorScheme(.dark)
}

struct UITextViewWrapper: UIViewRepresentable {
    typealias UIViewType = UITextView
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.isScrollEnabled = true
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        textView.backgroundColor = UIColor.clear // Устанавливаем прозрачный фон
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextViewDelegate {
        var parent: UITextViewWrapper

        init(_ textViewWrapper: UITextViewWrapper) {
            self.parent = textViewWrapper
        }

        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
    }
}
