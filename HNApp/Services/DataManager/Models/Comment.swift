//
//  Comment.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/27/24.
//

import Foundation

struct Comment: Hashable, Identifiable, Codable {
    let id: Int?
    let timePeriod: String?
    let text: String?
    let author: String?
    let level: Int?
    
    var isShown: Bool
    
    // MARK: - Init
    init(id: Int?, timePeriod: String?, text: String?, author: String?, level: Int?) {
        self.id = id
        self.timePeriod = timePeriod
        self.text = text
        self.author = author
        self.level = level
        
        self.isShown = level == .zero ? true : false
    }
}

// MARK: - Public
extension Comment {
    var isRoot: Bool {
        level == .zero
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Comment, rhs: Comment) -> Bool {
        lhs.id == rhs.id
    }
}
