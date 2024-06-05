//
//  TBType.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/21/24.
//

import Foundation

enum TBType: CaseIterable, Equatable {
    case stories, favorites, settings
}

// MARK: - Public
extension TBType {
    var systemImageName: String {
        switch self {
        case .stories:   return "house.fill"
        case .favorites: return "heart.fill"
        case .settings:  return "gearshape.fill"
        }
    }
}
