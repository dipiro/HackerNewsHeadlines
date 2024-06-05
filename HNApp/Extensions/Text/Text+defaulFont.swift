//
//  Text+defaulFont.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/14/24.
//

import SwiftUI

extension Text {
    func defaultSettings(weight: Font.Weight = .regular, style: Font.TextStyle = .body, color: Color = Color.mainLightText) -> some View {
        self
            .font(.system(style, design: .rounded, weight: weight))
            .foregroundStyle(color)
    }
}
