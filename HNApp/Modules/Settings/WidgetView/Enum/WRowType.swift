//
//  WRowType.swift
//  HNApp
//
//  Created by piro2 on 5/28/24.
//

import Foundation

enum WRowType: String, Identifiable, CaseIterable {
    case backgroundColor = "Background Color",
         textColor = "Text Color"
}

// MARK: - Public
extension WRowType {
    var id: Self { self }
}
