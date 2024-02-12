//
//  Date+Ext.swift
//  BoardAppsTest
//
//  Created by Alex on 12.02.2024.
//

import Foundation

extension Date {
    func formatted() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: self)
    }
}
