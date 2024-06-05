//
//  RouterSettings.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/19/24.
//

import Foundation

@Observable final class RouterSettings: RouterDataSource {
    typealias T = SettingsRoute
    
    // MARK: - Enum
    enum SettingsRoute: Hashable, Identifiable {
        case widget, icon, mail, post(Post), webView(ShareModel)
        
        var id: Self { self }
    }
    
    // MARK: - Properties
    var full: SettingsRoute?
    var sheet: SettingsRoute?
    var routes: [SettingsRoute] = []
    var type: SettingsRoute.Type { SettingsRoute.self }
    
    // MARK: - Functions
    func add(_ route: SettingsRoute) {
        routes.append(route)
    }
    
    func removeLast() {
        routes.removeLast()
    }
}
