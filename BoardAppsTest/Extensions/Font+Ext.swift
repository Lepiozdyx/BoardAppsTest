//
//  Font+Ext.swift
//  BoardAppsTest
//
//  Created by Alex on 12.02.2024.
//

import SwiftUI

extension Font {
    static func titleFont(size: CGFloat) -> Font {
        .system(size: size, weight: .semibold, design: .default)
    }
    
    static func bodyFont(size: CGFloat) -> Font {
        .system(size: size, weight: .regular, design: .default)
    }
}
