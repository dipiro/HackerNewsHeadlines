//
//  RouterFavorites.swift
//  HNApp
//
//  Created by piro2 on 5/31/24.
//

import Foundation

@Observable final class RouterFavorites: RouterDataSource {
    typealias T = FavoritesRoute
    
    // MARK: - Enum
    enum FavoritesRoute: Hashable, Identifiable {
        case post(Post), webView(ShareModel)
        
        var id: Self { self }
    }
    
    // MARK: - Properties
    var sheet: FavoritesRoute?
    var full: FavoritesRoute?
    var routes: [FavoritesRoute] = []
    var type: FavoritesRoute.Type { FavoritesRoute.self }
    
    // MARK: - func
    func add(_ route: FavoritesRoute) {
        routes.append(route)
    }
    
    func removeLast() {
        routes.removeLast()
    }
}
