//
//  SAboutCell.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/27/24.
//

import Foundation
import SwiftUI

struct SAboutCell: View {
    
    @Binding var currentLogoType: AppTheme.Logo
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: Const.hSpacing) {
            currentLogoType.image
                .resizable()
                .frame(width: Const.imageWidth, height: Const.imageWidth)
                .clipShape(RoundedRectangle(cornerRadius: Const.cornerRadius))
            VStack(alignment: .leading, spacing: Const.vSpacing) {
                Text("Hacker Headlines")
                    .defaultSettings(weight: .black, style: .title3)
                Text("By Dzmitry Pirozhnik")
                    .defaultSettings()
            }
        }
    }
}

// MARK: - Const
fileprivate struct Const {
    static let imageWidth: CGFloat = 72
    static let cornerRadius: CGFloat = 16
    static let hSpacing: CGFloat = 16
    static let vSpacing: CGFloat = 8
}
