//
//  WPreviewContent.swift
//  HNApp
//
//  Created by piro2 on 5/28/24.
//

import SwiftUI

struct WPreviewContent: View {
    var post: PostWidget
    var textColor: Color
    
    // MARK: - Body
    var body: some View {
        content
    }
}

// MARK: - Private
private extension WPreviewContent {
    var content: some View {
        VStack(alignment: .leading, spacing: Const.contentSpacing) {
            Spacer()
            if let host = post.displayHost {
                url(host)
            }
            title
            info
        }
        .padding(Const.contentPadding)
    }
    
    var title: some View {
        Text(post.title)
            .font(.system(.callout, design: .rounded, weight: .semibold))
            .foregroundStyle(textColor)
            .lineLimit(Const.titleLimit)
    }
    
    var info: some View {
        HStack {
            Text("\(post.createdTime) ago")
                .font(.system(.caption2, design: .rounded, weight: .regular))
                .foregroundStyle(textColor.opacity(Const.textOpadcity))
                .lineLimit(1)
            Divider()
                .frame(height: Const.dividerHeight)
            Text(post.by)
                .font(.system(.caption2, design: .rounded, weight: .regular))
                .foregroundStyle(textColor.opacity(Const.textOpadcity))
                .lineLimit(1)
        }
    }
    
    func url(_ host: String) -> some View {
        Text(host)
            .font(.system(.caption2, design: .rounded, weight: .regular))
            .foregroundStyle(textColor.opacity(Const.textOpadcity))
            .lineLimit(1)
    }
}

// MARK: - Const
fileprivate struct Const {
    static let contentPadding: CGFloat = 16
    static let contentSpacing: CGFloat = 4
    
    static let titleLimit: Int = 4
    
    static let textOpadcity: CGFloat = 0.8
    static let cornerRadius: CGFloat = 24
    static let dividerHeight: CGFloat = 12
}
