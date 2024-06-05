//
//  NoComments.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/25/24.
//

import SwiftUI

struct NoComments: View {
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: Const.spacing) {
            AppTheme.Icon.empty.image
                .resizable()
                .renderingMode(.template)
                .frame(width: Const.iconWidth, height: Const.iconWidth)
                .foregroundColor(Color.mainSubLightText)
            Text("No Comments")
                .defaultSettings(weight: .bold, style: .title3, color: Color.mainSubLightText)
        }
    }
}

// MARK: - Const
fileprivate struct Const {
    static let spacing: CGFloat = 8
    static let iconWidth: CGFloat = 72
}

// MARK: - Preview
#Preview {
    NoComments()
}
