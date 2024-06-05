//
//  FavoritesView.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/16/24.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Environment(\.modelContext) private var context
    @Environment(RouterManager.self) private var router
    @Query private var fetchedPosts: [Post]
    
    // MARK: - Body
    var body: some View {
        NavigationStack(path: Bindable(router).favorites.routes) {
            List(fetchedPosts) { item in
                PCell(post: item) {
                    router.favorites.add(.post(item))
                } linkAction: { url in
                    router.favorites.add(.webView(.init(url: url, title: item.title)))
                }
                .id(item.id)
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Color.background)
            .navigationTitle("Favorites")
            .navigationDestination(for: router.favorites.type, destination: destinationHandler)
        }
        .tint(Color.mainLightText)
    }
}

// MARK: - Private
private extension FavoritesView {
    @ViewBuilder func destinationHandler(_ type: RouterFavorites.FavoritesRoute) -> some View {
        switch type {
        case .post(let post):
            PostDetailView(post: post, context: context, from: .favorites)
        case .webView(let model):
            PostWebView(model: model)
        }
    }
}
