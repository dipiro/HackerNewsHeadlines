//
//  PostsViewModel.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/13/24.
//

import Foundation
import Observation

@Observable
final class PViewModel {
    var posts: [Post] = []
    var state: PState = .loading
    var category: HNCategoryType = .top
    
    var isMoreItemsAvailable: Bool {
        return posts.count >= Const.paginationStep
    }
    
    var categories: [HNCategoryType] {
        HNCategoryType.allCases
    }
    
    // MARK: - Private Properties
    private let hnApiNetworkManager = HNApiNetworkManager()
    
    private var ids: [Int] = []
    private var paginationRangeStart: Int = .zero
    private var task: Task<Void, Error>? = nil
}

// MARK: - Public
extension PViewModel {
    func fetchIdsAndItems() {
        task?.cancel()
        state = .loading
        
        task = Task(priority: .high) {
            do {
                try await fetchIds()
                try await performFetchingItems()
            } catch {
                if ((task?.isCancelled) != nil) {
                    state = .loading
                } else {
                    state = .error(error)
                }
            }
        }
    }
    
    func fetchMoreItems() {
        task?.cancel()
        
        task = Task {
            paginationRangeStart += Const.paginationStep
            do {
                try await performFetchingItems()
            } catch(let error) {
                state = .error(error)
            }
        }
    }
    
    func fetchRefresh() async {
        task?.cancel()
        
        task = Task {
            resetToLoading()
            do {
                try await fetchIds()
                try await performFetchingItems()
            } catch(let error) {
                state = .error(error)
            }
        }
    }
}

// MARK: - Private
private extension PViewModel {
    func performFetchingItems() async throws {
        let range = paginationRangeStart..<(paginationRangeStart + Const.paginationStep)
        var indexedPosts: [(index: Int, post: Post)] = []
        
        try await withThrowingTaskGroup(of: (Int, Post).self) { group in
            for index in range {
                group.addTask {
                    let post = try await self.hnApiNetworkManager.fetch(by: .story(id: self.ids[index]), for: Post.self)
                    return (index, post)
                }
            }
            
            for try await (index, post) in group {
                indexedPosts.append((index, post))
            }
        }
        
        let sortedPosts = indexedPosts
            .sorted { $0.index < $1.index }
            .map { $0.post }
        
        self.posts += sortedPosts
        state = .loaded
    }
    
    func fetchIds() async throws {
        resetToLoading()
        ids = try await hnApiNetworkManager.fetch(by: .stories(type: category), for: [Int].self)
    }
    
    func resetToLoading() {
        paginationRangeStart = .zero
        posts = []
        ids = []
        state = .loading
    }
}

// MARK: - Const
fileprivate struct Const {
    static let paginationStep: Int = 15
}
