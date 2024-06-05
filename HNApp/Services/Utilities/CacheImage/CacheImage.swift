//
//  CacheImage.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/14/24.
//

import Foundation
import SwiftUI

final class ImageCache {
    static let shared = ImageCache()
    
    static private var cache: [URL: Image] = [:]
    
    static subscript(url: URL) -> Image? {
        get { Self.cache[url] }
        set { Self.cache[url] = newValue }
    }
}
