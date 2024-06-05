//
//  RouterPosts.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/19/24.
//

import Foundation
import Observation

@Observable final class RouterPosts: RouterDataSource {
    typealias T = PostsRoute
    
    // MARK: - Enum
    enum PostsRoute: Hashable, Identifiable {
        case post(Post), webView(ShareModel)
        
        var id: Self { self }
    }
    
    // MARK: - Properties
    var sheet: PostsRoute?
    var full: PostsRoute?
    var routes: [PostsRoute] = []
    var type: PostsRoute.Type { PostsRoute.self }
    
    // MARK: - func
    func add(_ route: PostsRoute) {
        routes.append(route)
    }
    
    func removeLast() {
        routes.removeLast()
    }
}
