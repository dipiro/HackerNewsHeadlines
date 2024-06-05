//
//  PDStory.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/24/24.
//

import SwiftUI
import SwiftData

struct PDStory: View {
    var viewModel: PDViewModel
    var previewAction: VoidHandler?
    
    // MARK: - Private
    @State private var previewLinkViewModel = PreviewLinkManuallyViewModel()
    @State private var isCreated: Bool = false
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: Const.spacing) {
            VStack(spacing: Const.nestedSpacing) {
                preview
                info
            }
            if viewModel.post.text != nil {
                text
            }
        }
        .onTapGesture { previewAction?() }
        .firstOnAppear() {
            Task { await previewLinkFetchMetadata() }
        }
        .shadow(color: .black, radius: Const.shadowRadius)
    }
}

// MARK: - Private
private extension PDStory {
    var preview: some View {
        PDPreviewLinkManually(post: viewModel.post, viewModel: previewLinkViewModel)
    }
    
    var info: some View {
        PInfo(itemTypes:[.points(viewModel.post.displayScore),
                         .author(viewModel.post.by),
                         .commentsCount(viewModel.post.displayDescendants),
                         .date(viewModel.post.createdTime)])
    }
    
    
    var text: some View {
        Text(viewModel.handleString(viewModel.post.text))
            .defaultSettings(weight: .regular, style: .callout)
            .lineLimit(nil)
            .multilineTextAlignment(.leading)
            .tint(.red)
            .accentColor(.red)
            .padding(.horizontal)
    }
    
    func previewLinkFetchMetadata() async {
        if let url = viewModel.post.url, !isCreated {
            await previewLinkViewModel.fetchMetadata(by: url)
            isCreated = true
        }
    }
}

// MARK: - Const
fileprivate struct Const {
    static let spacing: CGFloat = 30
    static let nestedSpacing: CGFloat = 12
    static let shadowRadius: CGFloat = 5
}

// MARK: - Preview
#Preview {
    let container = ModelContainer.preview
    
    return PDStory(viewModel: .init(Post.preview, context: container.mainContext))
        .modelContainer(container)
}
