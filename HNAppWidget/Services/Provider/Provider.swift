//
//  Provider.swift
//  HNApp
//
//  Created by piro2 on 5/29/24.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    typealias SimpleEntry = StoryEntry
    
    // MARK: - Func
    func placeholder(in context: Context) -> SimpleEntry {
        return SimpleEntry(date: Date(), post: WidgetDefaults.shared.postWidget)
    }
    
    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        do {
            let post = try await fetchPost()
            return SimpleEntry(date: Date(), post: post)
        } catch {
            return SimpleEntry(date: Date(), post: WidgetDefaults.shared.postWidget)
        }
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        let entryDate = Calendar.current.date(byAdding: .minute, value: 15, to: Date())!
        var entries: [SimpleEntry] = []
        
        do {
            let post = try await fetchPost()
            entries = [SimpleEntry(date: Date(), post: post)]
        } catch {
            entries = [SimpleEntry(date: Date(), post: WidgetDefaults.shared.postWidget)]
        }
        
        return Timeline(entries: entries, policy: .after(entryDate))
    }
}

// MARK: - Private
private extension Provider {
    func fetchPost() async throws -> PostWidget {
        let ids = try await HNApiNetworkManager().fetch(by: .stories(type: .top), for: [Int].self)
        guard let firstId = ids.first else { throw AppError.WidgetError.notFoundId }
        let postWidget = try await HNApiNetworkManager().fetch(by: .story(id: firstId), for: PostWidget.self)
        WidgetDefaults.shared.postWidget = postWidget
        return postWidget
    }
}
