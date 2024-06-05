//
//  SwiftDataContainer.swift
//  HNApp
//
//  Created by piro2 on 5/30/24.
//

import Foundation
import SwiftData

class DataContainer {
    static let shared = DataContainer()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Post.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    @MainActor func fetchItems() -> [Post] {
        let items = try? sharedModelContainer.mainContext.fetch(FetchDescriptor<Post>())
        return items ?? []
    }
    
    @MainActor func itemIsSaved(item: Post) -> Bool {
        fetchItems().contains(where: { item.id == $0.id })
    }
    
    @MainActor func insert(_ item: Post) {
        sharedModelContainer.mainContext.insert(item)
    }
    
    @MainActor func delete(_ item: Post) {
        sharedModelContainer.mainContext.delete(item)
    }
}
