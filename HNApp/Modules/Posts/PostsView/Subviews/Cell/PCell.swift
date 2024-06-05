//
//  PostCell.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/14/24.
//

import SwiftUI

struct PCell: View {
    var post: Post
    private let favIcon: FavIcon = FavIcon()
    
    // MARK: - View
    var body: some View {
        VStack(alignment: .leading) {
            urlPanel
            titlePanel
            Divider()
            infoPanel
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: Const.bgCornerRadius, style: .continuous)
                .fill(.block)
        }
    }
}

// MARK: - Private Extension
private extension PCell {
    @ViewBuilder var urlPanel: some View {
        if let domain = post.domain, let url = post.url {
            HStack {
                gettingIcon()
                    .mask { Circle() }
                Text("[\(domain)](\(url))")
                    .defaultSettings(weight: .medium, style: .caption)
                    .accentColor(.main)
            }
            .frame(width: Const.infoPanelHeight, height: Const.infoPanelHeight)
        }
    }
    
    var titlePanel: some View {
        Text(post.title ?? "")
            .defaultSettings(weight: .semibold, style: .title3)
    }
    
    var infoPanel: some View {
        HStack {
            createItem(.points, title: post.points)
            Divider()
            createItem(.author, title: post.by)
            Divider()
            createItem(.commentsCount, title: post.commentsCount)
            Divider()
            createItem(.date, title: post.created + " ago")
        }
        .frame(height: Const.infoPanelHeight)
    }
    
    @ViewBuilder func gettingIcon() -> some View {
        if let domain = post.domain, let url = URL(string: FavIcon(domain)[.xxxl]) {
            CachedAsyncImage(url: url) { phase in
                if case .success(let image) = phase {
                    image
                        .resizable()
                        .scaledToFit()
                }
            }
        }
    }
    
    @ViewBuilder func createItem(_ type: PostCellItemType, title: String?) -> some View {
        if let title {
            HStack {
                type.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(Const.infoPanelOpacity)
                Text(title)
                    .defaultSettings(style: .caption, color: Color.lightText.opacity(Const.infoPanelOpacity))
            }
        }
    }
}

// MARK: - Const
fileprivate struct Const {
    static let bgCornerRadius: CGFloat = 16
    
    static let urlPanelHeight: CGFloat = 18
    
    static let infoPanelHeight: CGFloat = 12
    static let infoPanelOpacity: CGFloat = 0.6
}
