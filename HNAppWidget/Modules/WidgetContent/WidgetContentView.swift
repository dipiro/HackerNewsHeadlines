//
//  WidgetContentView.swift
//  HNAppWidgetExtension
//
//  Created by piro2 on 5/29/24.
//

import WidgetKit
import SwiftUI

struct WidgetContentView: View {
    var entry: Provider.Entry
    
    // MARK: - Private
    private var bgColor: Color {
        Color(hex: WidgetDefaults.shared.widgetBackgroundColorHex) ?? .red
    }
    
    private var textColor: Color {
        Color(hex: WidgetDefaults.shared.widgetTextColorHex) ?? .red
    }
    
    // MARK: - Body
    var body: some View {
        Rectangle()
            .fill(bgColor)
            .overlay {
                WPreviewContent(post: entry.post, textColor: textColor)
            }
    }
}
