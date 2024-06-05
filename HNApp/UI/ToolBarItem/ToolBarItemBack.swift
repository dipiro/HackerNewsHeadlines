//
//  ToolBarItemBack.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/15/24.
//

import SwiftUI

struct ToolBarItemImage: ToolbarContent {
    let placement: ToolbarItemPlacement
    let image: ButtonImageType
    let action: () -> Void
    
    // MARK: - Body
    var body: some ToolbarContent {
        ToolbarItem(placement: placement) {
            HapticButton { action() } label: {
                image.image
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(Color.mainLightText)
            }
        }
    }
}
