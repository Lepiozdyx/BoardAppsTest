//
//  CustomDatePicker.swift
//  BoardAppsTest
//
//  Created by Alex on 15.02.2024.
//

import SwiftUI

struct CustomDatePicker: View {
    @Binding var date: Date?
    
    var body: some View {
        DatePickerTextField(placeholder: "Date", date: $date)
            .frame(height: 62)
            .padding(.leading)
            .background(Color.background)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(date == nil ? .secondaryText : .accentColor, lineWidth: 1)
            )
    }
}

#Preview {
    CustomDatePicker(date: .constant(nil))
        .preferredColorScheme(.dark)
        .padding()
}

struct DatePickerTextField: UIViewRepresentable {
    private let textField = UITextField()
    private let datePicker = UIDatePicker()
    private let helper = Helper()
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter
    }()
    
    public var placeholder: String
    @Binding var date: Date?
    
    func makeUIView(context: Context) -> UITextField {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.addTarget(helper, action: #selector(helper.dateValueChanged), for: .valueChanged)
        textField.placeholder = placeholder
        textField.inputView = datePicker
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: helper, action: #selector(helper.doneButtonAction))
        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        textField.inputAccessoryView = toolbar
        
        helper.dateChanged = {
            date = datePicker.date
        }
        
        helper.doneButtonTapped = {
            if date == nil {
                date = datePicker.date
            }
            textField.resignFirstResponder()
        }
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        if let date = date {
            uiView.text = dateFormatter.string(from: date)
        } else {
            uiView.text = nil
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Helper {
        public var dateChanged: (() -> Void)?
        public var doneButtonTapped: (() -> Void)?
        
        @objc func dateValueChanged(sender: UIDatePicker) {
            self.dateChanged?()
        }
        
        @objc func doneButtonAction() {
            self.doneButtonTapped?()
        }
    }
    
    class Coordinator {}
}
