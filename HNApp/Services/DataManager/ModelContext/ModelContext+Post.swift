//
//  ModelContext+Post.swift
//  HNApp
//
//  Created by piro2 on 5/31/24.
//

import Foundation
import SwiftData

extension ModelContext {
    func fetchItems() -> [Post] {
        let items = try? self.fetch(FetchDescriptor<Post>())
        return items ?? []
    }
    
    func itemIsSaved(item: Post) -> Bool {
        fetchItems().contains(where: { item.id == $0.id })
    }
}
