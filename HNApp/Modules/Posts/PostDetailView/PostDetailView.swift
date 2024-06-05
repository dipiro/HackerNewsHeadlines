//
//  PostDetailView.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/14/24.
//

import SwiftUI
import SwiftData

struct PostDetailView: View {
    enum PostDetailViewDestination {
        case posts, favorites
    }
    
    // MARK: - Properties
    @Environment(\.modelContext) var context
    @Environment(\.openURL) var openURL
    @Environment(\.isPresented) private var isPresented
    @Environment(TBStateViewModel.self) private var tabBarState
    @Environment(RouterManager.self) private var router
    
    @State private var viewModel: PDViewModel
    private var destinationFrom: PostDetailViewDestination
    
    // MARK: - Init
    init(post: Post, context: ModelContext, from destination: PostDetailView.PostDetailViewDestination) {
        self._viewModel = State(initialValue: PDViewModel(post, context: context))
        self.destinationFrom = destination
    }
    
    // MARK: - Body
    var body: some View {
        PDList(items: viewModel.comments) { item in
            PDCell(comment: item, viewModel: viewModel, action: viewModel.expandBranchToggle)
                .id(item.id)
        } header: {
            VStack {
                PDStory(viewModel: viewModel) {
                    if let url = viewModel.post.url {
                        if Defaults.shared.browserType == .safari {
                            openURL(url)
                        } else {
                            if destinationFrom == .posts {
                                router.posts.add(.webView(.init(url: url, title: viewModel.post.title)))
                            } else {
                                router.favorites.add(.webView(.init(url: url, title: viewModel.post.title)))
                            }
                        }
                    }
                }
                .id(viewModel.post.id)
                stateHandler()
                    .padding(.top, Const.stateTopPadding)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar { toolbar }
        .onAppear() { tabBarState.toggleTabBarState(isPresented) }
        .task { await viewModel.fetchComments() }
        .onChange(of: isPresented, { oldValue, newValue in
            tabBarState.toggleTabBarState(newValue)
        })
    }
}

// MARK: - Private
private extension PostDetailView {
    var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            HStack(spacing: Const.toolbarSpacing) {
                if let url = viewModel.post.url {
                    ButtonShare(model: .init(url: url, title: viewModel.post.title))
                }
                
                ButtonFavorite(isSelected: context.itemIsSaved(item: viewModel.post)) { isSelected in
                    viewModel.toggleSavedPost(isSaved: isSelected)
                    if destinationFrom == .favorites && isSelected {
                        router.favorites.removeLast()
                    }
                }
            }
        }
    }
    
    @ViewBuilder func stateHandler() -> some View {
        switch viewModel.state {
        case .loaded:           EmptyView()
        case .loading:          LoadingView()
        case .noComments:       NoComments()
        case .error(let error): ErrorView(error)
        }
    }
}

// MARK: - Const
fileprivate struct Const {
    static let toolbarSpacing: CGFloat = 16
    static let stateTopPadding: CGFloat = 26
}

// MARK: - Preview
#Preview {
    let container = ModelContainer.preview
    
    return NavigationStack {
        PostDetailView(post: .preview, context: container.mainContext, from: .posts)
            .modelContainer(container)
            .environment(TBStateViewModel())
            .environment(RouterManager())
    }
}
