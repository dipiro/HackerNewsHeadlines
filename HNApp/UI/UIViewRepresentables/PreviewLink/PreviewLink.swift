//
//  PreviewLink.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/15/24.
//

import LinkPresentation
import SwiftUI
import UIKit

final class CustomPreviewLink: LPLinkView {
    override var intrinsicContentSize: CGSize { CGSize(width: super.intrinsicContentSize.width,
                                                       height: .zero) }
}

struct PreviewLink: UIViewRepresentable {
    typealias UIViewType = CustomPreviewLink
    
    // MARK: - Properties
    var metadata: LPLinkMetadata?
 
    // MARK: - Func
    func makeUIView(context: Context) -> UIViewType {
        guard let metadata = metadata else { return UIViewType() }
        
        let linkView = UIViewType(metadata: metadata)
        linkView.sizeToFit()
        linkView.isUserInteractionEnabled = false
        
        return linkView
    }
 
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}
