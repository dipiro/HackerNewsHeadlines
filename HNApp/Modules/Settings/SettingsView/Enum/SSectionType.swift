//
//  SettingsSectionType.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/16/24.
//

import Foundation

enum SSectionType: Identifiable, Hashable {
    case info([SRowType])
    case customization([SRowType])
    case interface([SRowType])
}

// MARK: - Public
extension SSectionType {
    var id: Self { self }
    
    var title: String {
        switch self {
        case .info(_):                      return ""
        case .customization(_):             return "Customization"
        case .interface(_):                 return "Interface"
        }
    }
    
    var rows: [SRowType] {
        switch self {
        case .info(let array):              return array
        case .interface(let array):         return array
        case .customization(let array):     return array
        }
    }
}
