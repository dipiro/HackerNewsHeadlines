//
//  PostsView.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/13/24.
//

import SwiftUI
import SwiftData

struct PostsView: View {
    @Environment(\.openURL) var openURL
    @Environment(\.modelContext) private var context
    @Environment(RouterManager.self) private var router
    @State private var viewModel = PViewModel()
    
    // MARK: - Body
    var body: some View {
        NavigationStack(path: Bindable(router).posts.routes) {
            list
                .navigationTitle("Stories")
                .navigationDestination(for: router.posts.type, destination: destinationHandler)
                .firstOnAppear() { viewModel.fetchIdsAndItems() }
                .onChange(of: viewModel.category) { viewModel.fetchIdsAndItems() }
        }
        .tint(Color.mainLightText)
    }
}

// MARK: - Private
private extension PostsView {
    var segmentedControl: some View {
        OrangeSegmentedControl(selectedItem: Bindable(viewModel).category,
                               items: viewModel.categories) { type in
            Text(type.rawValue)
                .defaultSettings(weight: .medium)
        }
    }
    
    var list: some View {
        PList(items: Bindable(viewModel).posts) { item in
            PCell(post: item) {
                router.posts.add(.post(item))
            } linkAction: { url in
                if Defaults.shared.browserType == .safari {
                    openURL(url)
                } else {
                    router.posts.add(.webView(.init(url: url, title: item.title)))
                }
            }
        } overlabel: {
            segmentedControl
        } sublabel: {
            if viewModel.isMoreItemsAvailable {
                paginationView
            }
        }
        .refreshable { await viewModel.fetchRefresh() }
        .overlay {stateHandler() }
    }
    
    var paginationView: some View {
        LoadingView()
            .onAppear { viewModel.fetchMoreItems() }
    }
    
    @ViewBuilder func stateHandler() -> some View {
        switch viewModel.state {
        case .loading:
            LoadingView()
        case .error(let error):
            ErrorView(error)
        case .loaded:
            EmptyView()
        }
    }
    
    @ViewBuilder func destinationHandler(_ type: RouterPosts.PostsRoute) -> some View {
        switch type {
        case .post(let post):
            PostDetailView(post: post, context: context, from: .posts)
        case .webView(let model):
            PostWebView(model: model)
        }
    }
}
