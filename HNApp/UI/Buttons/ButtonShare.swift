//
//  ButtonShare.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/27/24.
//

import SwiftUI

struct ButtonShare: View {
    
    var model: ShareModel
    
    // MARK: - Body
    var body: some View {
        ShareLink(item: model.url, preview: SharePreview(model.title)) {
            Label("Share", systemImage: "square.and.arrow.up")
        }
    }
}
