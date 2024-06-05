//
//  PreviewContainer.swift
//  HNApp
//
//  Created by piro2 on 5/31/24.
//

import Foundation
import SwiftData

extension ModelContainer {
    static var preview: ModelContainer {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Post.self, configurations: config)
        return container
    }
}
