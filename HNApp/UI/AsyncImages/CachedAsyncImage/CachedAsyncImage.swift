//
//  CachedAsyncImage.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/14/24.
//

import Foundation
import SwiftUI

struct CachedAsyncImage<Content: View>: View {
    let url: URL
    let scale: CGFloat = 1.0
    let transaction: Transaction = .init(animation: .bouncy(duration: 1))
    @ViewBuilder  let content: (AsyncImagePhase) -> Content
    
    // MARK: - Body
    var body: some View {
        if let cached = ImageCache[url] {
            content(.success(cached))
        } else {
            AsyncImage(url: url,
                       scale: scale,
                       transaction: transaction,
                       content: cacheAndRender)
        }
    }
}

// MARK: - Private
private extension CachedAsyncImage {
    func cacheAndRender(phase: AsyncImagePhase) -> some View {
        if case .success(let image) = phase {
            ImageCache[url] = image
        }
        
        return content(phase)
    }
}
