//
//  CustomTextEditor.swift
//  BoardAppsTest
//
//  Created by Alex on 12.02.2024.
//

import SwiftUI

struct CustomTextEditor: View {
    let title: String
    
    @Binding var text: String
    
    @State private var frameHeight: CGFloat = 0
    private let maxFrameHeight: CGFloat = 180
    
    var body: some View {
        HStack(spacing: .zero) {
            TextView(title: title, text: $text, frameHeight: $frameHeight)
                .frame(height: min(frameHeight, maxFrameHeight))
                .padding()
                .background(Color.background)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(text.isEmpty ? .secondaryText: .accentColor, lineWidth: 1)
                )
        }
    }
}

#Preview {
    CustomTextEditor(title: "Text", text: .constant(""))
        .preferredColorScheme(.dark)
        .padding()
}

private struct TextView: UIViewRepresentable {
    let title: String
    @Binding var text: String
    @Binding var frameHeight: CGFloat
    
    private let fontSize: CGFloat = 17
    private let leftContentInset: CGFloat = -4
    private let helper = Helper()
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.isEditable = true
        textView.isScrollEnabled = true
        textView.text = title
        textView.textColor = .secondaryText.withAlphaComponent(0.6)
        textView.font = .systemFont(ofSize: fontSize)
        textView.contentInset = .init(
            top: .zero,
            left: leftContentInset,
            bottom: .zero,
            right: .zero
        )
        textView.backgroundColor = .clear
        
        // Create a toolbar with a Done button
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: helper, action: #selector(helper.doneButtonAction))
        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        textView.inputAccessoryView = toolbar
        
        helper.textChanged = {
            text = textView.text
        }
        
        helper.doneButtonTapped = {
            text = textView.text
            textView.resignFirstResponder()
        }
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context _: Context) {
        DispatchQueue.main.async {
            if uiView.text != title {
                uiView.text = text
                uiView.textColor = .white
            }
            frameHeight = uiView.contentSize.height
        }
    }
    
    func makeCoordinator() -> Coordinator {
        TextView.Coordinator(self)
    }
    
    final class Coordinator: NSObject, UITextViewDelegate {
        private var parent: TextView
        private let updateDelay = 0.1
        
        init(_ parent: TextView) {
            self.parent = parent
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.text == parent.title {
                textView.text = ""
                textView.textColor = .white
            }
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
            parent.frameHeight = textView.contentSize.height
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            DispatchQueue.main.asyncAfter(deadline: .now() + updateDelay) {
                if textView.text.isEmpty {
                    textView.text = self.parent.title
                    textView.textColor = .white
                }
            }
        }
    }
    
    class Helper {
        public var textChanged: (() -> Void)?
        public var doneButtonTapped: (() -> Void)?
        
        @objc func dateValueChanged(sender: UIDatePicker) {
            self.textChanged?()
        }
        
        @objc func doneButtonAction() {
            self.doneButtonTapped?()
        }
    }
}
