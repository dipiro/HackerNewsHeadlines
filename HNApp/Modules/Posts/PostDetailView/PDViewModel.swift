//
//  PostDetailViewModel.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/26/24.
//

import Foundation
import Observation
import SwiftData

@Observable class PDViewModel {
    var state: PDState = .loading
    
    var postIsSaved: Bool {
        let posts = try? context.fetch(FetchDescriptor<Post>())
        let isSaved = posts?.contains(where: { $0.id == post.id })
        return isSaved ?? false
    }
    
    var context: ModelContext
    
    var comments: [Comment] {
        _comments.filter { $0.isShown }
    }
    
    // MARK: - Private Properties
    private(set) var post: Post
    private let hnWebComments = HNWebCommentNetworkManager()
    private let htmlParser = HTMLParser()
    private let stringHandler = StringHandler()
    private var _comments: [Comment] = []
    
    // MARK: - Init
    init(_ post: Post, context: ModelContext) {
        self.post = post
        self.context = context
    }
}

// MARK: - Public
extension PDViewModel {
    func fetchComments() async  {
        do {
            let html = try await hnWebComments.fetchComments(by: post.id)
            _comments = await htmlParser.parseComments(html: html)
            
            state = _comments.isEmpty ? .noComments : .loaded
        }
        catch(let error) {
            state = .error(error)
        }
    }
    
    func expandBranchToggle(for comment: Comment)  {
        guard let index = _comments.firstIndex(where: { $0.id == comment.id }),
              let currentStep = comment.level else { return }
        
        searchSubbranch(index, currentLevel: currentStep)
    }
    
    func needsAddExpanding(for comment: Comment) -> Bool {
        guard let index = _comments.firstIndex(where: { $0.id == comment.id }),
              index + 1 != _comments.count else { return false }
        return _comments[index + 1].level != comment.level && comment.isRoot
    }
    
    func handleString(_ text: String?) -> AttributedString {
        stringHandler.handleString(text)
    }
    
    func toggleSavedPost(isSaved: Bool) {
        if isSaved {
            try? context.fetch(FetchDescriptor<Post>())
                .forEach { post in
                    if post.id == self.post.id {
                        context.delete(post)
                        return
                    }
                }
            
        } else {
            context.insert(post)
        }
    }
}

// MARK: - Private
private extension PDViewModel {
    func searchSubbranch(_ stepId: Int, currentLevel: Int) {
        guard stepId + 1 != _comments.count else { return }
        
        let nextComments = _comments[stepId + 1]
        
        if let nextLevel = nextComments.level,
           currentLevel < nextLevel && currentLevel < nextLevel + 1 {
            _comments[stepId + 1].isShown.toggle()
            
            searchSubbranch(stepId + 1, currentLevel: currentLevel)
        }
    }
}
