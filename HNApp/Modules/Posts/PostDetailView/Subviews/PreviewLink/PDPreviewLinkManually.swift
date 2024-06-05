//
//  PDPreviewLinkManually.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/22/24.
//

import SwiftUI

struct PDPreviewLinkManually: View {
    var post: Post
    
    // MARK: - Private Properties
    var viewModel = PreviewLinkManuallyViewModel()
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .center) {
            title
            image
            url
        }
        .background() {
            RoundedRectangle(cornerRadius: Const.cornerRadius)
                .fill(.block)
                .shadow(radius: Const.shadow)
        }
    }
}

// MARK: - Private
private extension PDPreviewLinkManually {
    var title: some View {
        Text(post.title)
            .defaultSettings(weight: .bold, style: .headline)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(Const.paddingFromCenter)
    }
    
    @ViewBuilder var image: some View {
        if !viewModel.noImage  {
            Rectangle()
                .fill(.clear)
                .frame(height: Const.imageHeight)
                .background() {
                    if viewModel.image == nil {
                        LoadingView()
                    }
                }
                .overlay {
                    if let uiImage = viewModel.image {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(height: Const.imageHeight)
                            .mask {
                                Rectangle()
                            }
                    }
                }
        }
    }
    
    @ViewBuilder var url: some View {
        if let _ = post.url, let host = post.displayHost {
            Text("\(host)")
                .defaultSettings(style: .caption, color: AppColor.main.color)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .bottom, .trailing], Const.paddingFromCenter)
        }
    }
}

// MARK: - Const
fileprivate struct Const {
    static let paddingToCenter: CGFloat = 4
    static let paddingFromCenter: CGFloat = 16
    
    static let imageHeight: CGFloat = 140
    static let cornerRadius: CGFloat = 24
    static let shadow: CGFloat = 7
}

