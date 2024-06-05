//
//  HNCategoryType.swift
//  HNApp
//
//  Created by piro2 on 5/29/24.
//

import Foundation

enum HNCategoryType: String, Identifiable, CaseIterable {
    case top = "Top Stories",
         new = "New Stories",
         best = "Best Stories",
         ask = "Ask Stories",
         show = "Show Stories",
         job = "Job Stories"
}

// MARK: - Public
extension HNCategoryType {
    var id: Self { self }
}
