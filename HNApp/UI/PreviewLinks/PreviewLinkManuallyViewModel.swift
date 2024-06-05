//
//  PreviewLinkManuallyViewModel.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/17/24.
//

import Foundation
import SwiftUI
import LinkPresentation
import UniformTypeIdentifiers
import Observation

@Observable
final class PreviewLinkManuallyViewModel {
    var image: UIImage?
    var title: String?
    var host: String?
    var noImage: Bool = false
    
    //MARK: - Private
    private let provider = LPMetadataProvider()
    private let metadataCache = MetadataCache()
    
    // MARK: - Func
    func fetchMetadata(by url: URL?) async {
        do {
            guard let url else { throw AppError.NetworkError.invalidUrl }
            
            if let cachedMetadata = metadataCache.get(urlString: url.absoluteString) {
                try await fullProperties(cachedMetadata, url: url)
            } else {
                let metadata = try await provider.startFetchingMetadata(for: url)
                try await fullProperties(metadata, url: url)
            }
        } catch(let error) {
            print(error.localizedDescription)
        }
    }
}


// MARK: - Private
private extension PreviewLinkManuallyViewModel {
    func convertToImage(_ imageProvider: NSItemProvider?) async throws -> UIImage? {
        var image: UIImage?
        let type = String(describing: UTType.image)
        
        if let imageProvider,
           imageProvider.hasItemConformingToTypeIdentifier(type),
           let item = try? await imageProvider.loadItem(forTypeIdentifier: type),
           let data = item as? Data {
            image = UIImage(data: data)
        }
        
        return image
    }
    
    func fullProperties(_ metadata: LPLinkMetadata, url: URL) async throws {
        image = try await convertToImage(metadata.imageProvider)
        title = metadata.title
        host = url.host()
        
        if image == nil {
            noImage = true
        }
    }
}
