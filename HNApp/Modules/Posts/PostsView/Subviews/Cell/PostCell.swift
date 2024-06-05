//
//  PostCell.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/14/24.
//

import SwiftUI

struct PCell: View {
    var post: Post
    var action: VoidHandler
    var linkAction: (URL) -> Void
    
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
        .onTapGesture(perform: action)
    }
}

// MARK: - Private Extension
private extension PCell {
    @ViewBuilder var urlPanel: some View {
        if let domain = post.displayHost, let url = post.url {
            HStack {
                gettingIcon()
                    .mask { Circle() }
                    .frame(width:  Const.infoPanelHeight, height: Const.infoPanelHeight)
                Text("\(domain)")
                    .defaultSettings(weight: .medium, style: .caption, color: AppColor.main.color)
            }
            .onTapGesture {
                linkAction(url)
            }
        }
    }
    
    var titlePanel: some View {
        Text(post.title)
            .defaultSettings(weight: .semibold, style: .title3)
    }
    
    var infoPanel: some View {
        HStack {
            createItem(.points(nil), title: post.displayScore)
            Divider()
            createItem(.author(nil), title: post.by)
            Divider()
            createItem(.commentsCount(nil), title: post.displayDescendants)
            Divider()
            createItem(.date(nil), title: post.createdTime + " ago")
        }
        .frame(height: Const.infoPanelHeight)
    }
    
    @ViewBuilder func gettingIcon() -> some View {
        if let domain = post.displayHost,
            let url = URL(string: String(format: AppConstant.Link.favIconDomain, domain)) {
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
                    .defaultSettings(style: .caption, color: Color.mainLightText.opacity(Const.infoPanelOpacity))
            }
        }
    }
}

// MARK: - Const
fileprivate struct Const {
    static let bgCornerRadius: CGFloat = 24
    
    static let urlPanelHeight: CGFloat = 18
    
    static let infoPanelHeight: CGFloat = 12
    static let infoPanelOpacity: CGFloat = 0.6
}
