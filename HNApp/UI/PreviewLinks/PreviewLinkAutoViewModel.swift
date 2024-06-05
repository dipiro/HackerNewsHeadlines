//
//  PreviewLinkAutoViewModel.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/17/24.
//

import Foundation
import LinkPresentation
import Observation

@Observable
@MainActor final class PreviewLinkAutoViewModel {
    var metadata: LPLinkMetadata?
    
    // MARK: - Private Properties
    private let provider = LPMetadataProvider()
    private let metadataCache = MetadataCache()
    
    // MARK: - Func
    func fetchMetadata(by url: URL?) async throws {
        guard let url else { return }
        
        if let cachedMetadata = metadataCache.get(urlString: url.absoluteString) {
            metadata = cachedMetadata
        } else {
            metadata = try await provider.startFetchingMetadata(for: url)
        }
    }
}
