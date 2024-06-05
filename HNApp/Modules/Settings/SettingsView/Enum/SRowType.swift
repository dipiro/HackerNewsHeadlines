//
//  SettingsCellType.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/16/24.
//

import Foundation

enum SRowType: String, Identifiable, Hashable {
    case feedback   = "Send Feedback"
    case github     = "GitHub"
    case rate       = "Rate Us"
    case about      = ""
    case icon       = "Icon Customization"
    case widget     = "Widget Customization"
    case openLink   = "Open Link"
    case color      = "Favorite Color"
}

// MARK: - Public 
extension SRowType {
    var id: Self { self }
}
