//
//  Router.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/19/24.
//

import Foundation
import Observation

@Observable final class RouterManager {
    var posts = RouterPosts()
    var favorites = RouterFavorites()
    var settings = RouterSettings()
    
    func reset() {
        settings.routes = []
        posts.routes = []
        favorites.routes = []
    }
}
