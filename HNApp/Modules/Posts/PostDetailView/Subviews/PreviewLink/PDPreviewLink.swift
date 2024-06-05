//
//  PDPreviewLink.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/17/24.
//

import SwiftUI

struct PDPreviewLink: View {
    
    var previewLinkViewModel: PreviewLinkAutoViewModel
    var action: () -> ()
    
    // MARK: - Body
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(previewLinkViewModel.metadata == nil ? .block : .clear)
            .frame(maxHeight: 200)
            .overlay {
                if let metadata = previewLinkViewModel.metadata {
                    PreviewLink(metadata: metadata)
                        .onTapGesture { action() }
                } else {
                    ProgressView()
                }
            }
    }
}
