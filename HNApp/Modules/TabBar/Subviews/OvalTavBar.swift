//
//  OvalTavBar.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/14/24.
//

import SwiftUI

struct OvalTavBar<Item: Hashable, Content: View>: View {
    @Binding var currentTab: Item
    
    var items: [Item]
    var spacing: CGFloat = 28
    var hPadding: CGFloat = 12
    var height: CGFloat = 40
    var content: (Item) -> Content
    
    // MARK: - Private Properties
    private var vPadding: CGFloat {
        hPadding / 2
    }
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: spacing) {
            ForEach(items, id: \.self) { item in
                content(item)
                    .id(item)
                    .frame(width: height, height: height)
                    .opacity(currentTab == item ? 1 : 0.5)
            }
        }
        .padding(.horizontal, hPadding)
        .padding(.vertical, vPadding)
        .background {
            GeometryReader { proxy in
                let size = proxy.size
                backgroundView
                highlightedCircle(size: size)
            }
        }
    }
}

// MARK: - Private
private extension OvalTavBar {
    var backgroundView: some View {
        RoundedRectangle(cornerRadius: .infinity, style: .circular)
            .fill(.block)
            .shadow(radius: 8)
    }
    
    func highlightedCircle(size: CGSize) -> some View {
        Circle()
            .fill(AppColor.main.color)
            .frame(width: height, height: height)
            .offset(x: getXOffset(width: size.width),
                    y: getYOffset(height: size.height))
    }
    
    // MARK: - Func
    func getXOffset(width: CGFloat) -> CGFloat {
        guard let arrayIndex = items.firstIndex(of: currentTab) else { return .zero }
        
        let index = CGFloat(items.distance(to: arrayIndex))
        let itemCounts = CGFloat(items.count)
        
        let widthNoPadding = width - hPadding * 2
        let buttonWidth = widthNoPadding / itemCounts
        let spacingCount = spacing / itemCounts
        
        return (index * buttonWidth) + (index * spacingCount) + hPadding
    }
    
    func getYOffset(height: CGFloat) -> CGFloat {
        return height - vPadding - self.height
    }
}
