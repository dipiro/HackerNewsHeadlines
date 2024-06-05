//
//  PDInfoPanel.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/23/24.
//

import SwiftUI

struct PInfo: View {
    var itemTypes: [PostCellItemType]
    
    // MARK: - Body
    var body: some View {
        HStack {
            ForEach(Array(itemTypes.enumerated()), id: \.element) { index, type in
                switch type {
                case .author(let value):
                    createItem(type, title: value)
                case .commentsCount(let value):
                    createItem(type, title: value)
                case .date(let value):
                    createItem(type, title: (value ?? "") + " ago")
                case .points(let value):
                    createItem(type, title: value)
                }
                
                if index !=  itemTypes.count - 1 {
                    Divider()
                }
            }
        }
        .frame(height: Const.infoPanelHeight)
    }
}

// MARK: - Private
private extension PInfo {
    @ViewBuilder func createItem(_ type: PostCellItemType, title: String?) -> some View {
        if let title {
            HStack {
                type.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(Const.infoPanelOpacity)
                Text(title)
                    .defaultSettings(style: .caption, color: Color.mainLightText.opacity(Const.infoPanelOpacity))
            }
        }
    }
}

// MARK: - Const
fileprivate struct Const {
    static let bgCornerRadius: CGFloat = 24
    
    static let urlPanelHeight: CGFloat = 18
    
    static let infoPanelHeight: CGFloat = 12
    static let infoPanelOpacity: CGFloat = 0.6
}

