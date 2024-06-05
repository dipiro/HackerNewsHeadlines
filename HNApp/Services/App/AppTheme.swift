//
//  AppTheme.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/26/24.
//

import Foundation
import SwiftUI

typealias AppColor = AppTheme.Color
typealias AppIcon = AppTheme.Icon

enum AppTheme {
    enum Icon {
        case error, empty
        
        var image: Image {
            switch self {
            case .error:    Image("error")
            case .empty:    Image("empty")
            }
        }
    }
    
    enum Logo: String, CaseIterable {
        case logo1, logo2, logo3, logo4, logo5
        
        var image: Image {
            Image(self.rawValue)
        }
    }
    
    enum Font {
        
    }
    
    enum Color {
        case main
        
        var color: SwiftUI.Color {
            switch self {
            case .main: 
                let mainHex = Defaults.shared.mainColorHex
                return SwiftUI.Color(hex: mainHex) ?? SwiftUI.Color.orange
            }
        }
    }
}
