//
//  PDCell.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/24/24.
//

import Foundation
import SwiftUI

struct PDCell: View {
    var comment: Comment
    var viewModel: PDViewModel
    var action: (Comment) -> ()
    
    // MARK: - Private
    @State private var branchIsExpanded: Bool = false
    
    // MARK: - Init
    init(comment: Comment, viewModel: PDViewModel, action: @escaping (Comment) -> Void) {
        self.comment = comment
        self.viewModel = viewModel
        self.action = action
        self.branchIsExpanded = comment.isRoot ? false : true
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            if comment.isRoot { divider }
            VStack(alignment: .leading, spacing: Const.blocksVPadding) {
                VStack(alignment: .leading) {
                    info
                    Divider()
                    text
                    if viewModel.needsAddExpanding(for: comment) {
                        Divider()
                        showingComments
                    }
                }
                .padding()
                .background() { background }
            }
            .padding(.leading, CGFloat(comment.level ?? 0) * Const.stepLeadingPadding)
        }
    }
}

// MARK: - Private
private extension PDCell {
    var divider: some View {
        Divider()
            .padding(.vertical)
    }
    
    var text: some View {
        VStack(alignment: .leading, spacing: Const.blocksVPadding) {
            Text(viewModel.handleString(comment.text))
                .defaultSettings(weight: .regular, style: .callout)
                .tint(AppColor.main.color)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, Const.dividerVPadding)
        }
    }
    
    var info: some View {
        PInfo(itemTypes: [.author(comment.author), .date(comment.timePeriod)])
    }
    
    var background: some View {
        RoundedRectangle(cornerRadius: Const.cornerRadius)
            .fill(.block)
    }
    
    var showingComments: some View {
        Text(branchIsExpanded ? "Collapse the branch" : "Expand the branch")
            .defaultSettings(weight: .regular, style: .callout, color: AppColor.main.color)
            .frame(maxWidth: .infinity)
            .onTapGesture() {
                branchIsExpanded.toggle()
                action(comment)
            }
    }
}

// MARK: - Const
fileprivate struct Const {
    static let stepLeadingPadding: CGFloat = 16
    static let cornerRadius: CGFloat = 14
    static let dividerVPadding: CGFloat = 8
    static let blocksVPadding: CGFloat = 12
}
