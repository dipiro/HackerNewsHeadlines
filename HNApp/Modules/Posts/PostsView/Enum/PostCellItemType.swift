//
//  PostCellItemType.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/22/24.
//

import Foundation
import SwiftUI

enum PostCellItemType: Identifiable, Hashable {
    case points(String?), commentsCount(String?), author(String?), date(String?)
}

// MARK: - Extension
extension PostCellItemType {
    var id: Self { self }
    
    var image: Image {
        switch self {
        case .points:
            return Image(systemName: "plus.circle.fill")
        case .commentsCount:
            return Image(systemName: "list.bullet.circle.fill")
        case .author:
            return Image(systemName: "person.circle.fill")
        case .date:
            return Image(systemName: "calendar.circle.fill")
        }
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .points(let value):        hasher.combine(value)
        case .commentsCount(let value): hasher.combine(value)
        case .author(let value):        hasher.combine(value)
        case .date(let value):          hasher.combine(value)
        }
    }
}

