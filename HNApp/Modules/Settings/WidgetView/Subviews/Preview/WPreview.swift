//
//  WidgetPreview.swift
//  HNApp
//
//  Created by piro2 on 5/28/24.
//

import SwiftUI

struct WPreview: View {
    @Environment(WViewModel.self) var viewModel: WViewModel
    
    private let widgetDeterminingSizeHelper = WidgetDeterminingSizeHelper()
    
    private var bgColor: Color {
        Color(hex: viewModel.bgColorHex) ?? .red
    }
    
    private var textColor: Color {
        Color(hex: viewModel.textColorHex) ?? .red
    }
    
    // MARK: - Body
    var body: some View {
        preview {
            previewContent {
                WPreviewContent(post: .init(from: viewModel.post),
                                textColor: textColor)
            }
        }
    }
}

// MARK: - Private
private extension WPreview {
    func preview(@ViewBuilder _ content: @escaping () -> some View) -> some View {
        RoundedRectangle(cornerRadius: Const.cornerRadius)
            .fill(.block)
            .overlay { content() }
            .padding()
            .frame(height: widgetDeterminingSizeHelper.smallSize.height * Const.multiplier)
    }
    
    func previewContent(@ViewBuilder _ content: @escaping () -> some View) -> some View {
        RoundedRectangle(cornerRadius: Const.cornerRadius)
            .fill(bgColor)
            .frame(width: widgetDeterminingSizeHelper.smallSize.width,
                   height: widgetDeterminingSizeHelper.smallSize.height,
                   alignment: .center)
            .overlay {
                content()
            }
    }
}

// MARK: - Const
fileprivate struct Const {
    static let cornerRadius: CGFloat = 16
    static let multiplier: CGFloat = 1.6
}

// MARK: - Preview
#Preview {
    WPreview()
        .padding(.horizontal)
        .environment(WViewModel(post: Post.preview))
}
