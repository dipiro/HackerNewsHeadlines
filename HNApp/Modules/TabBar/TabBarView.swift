//
//  TabBarView.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/14/24.
//

import Foundation
import SwiftUI

struct TabBarView: View {
    @Environment(RouterManager.self) private var router
    @Environment(TBStateViewModel.self) private var tabBarState
    @State private var currentTab: TBType = .stories
    
    // MARK: - Init
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.stackedLayoutAppearance.normal.iconColor = .white
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color.accentColor)
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(Color.accentColor)]
        
        UITabBar.appearance().standardAppearance = appearance
    }
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentTab) {
                PostsView()
                    .tag(TBType.stories)
                FavoritesView()
                    .tag(TBType.favorites)
                SettingsView()
                    .tag(TBType.settings)
            }
            
            OvalTavBar(currentTab: $currentTab, items: TBType.allCases, content: tabBarContent)
                .opacity(tabBarState.state == .withTabBar ? 1.0 : 0.0)
        }
        .onOpenURL(perform: performUrl)
    }
    
}

// MARK: - Private
private extension TabBarView {
    func tabBarContent(by item: TBType) -> some View {
        ButtonImage(type: .customSystemName(item.systemImageName), padding: 7, aspectRatio: 1, color: .clear) { _ in
            currentTab = item
        }
    }
    
    func performUrl(_ url: URL) {
        Task {
            let post = try await HNApiNetworkManager()
                .fetch(by: .story(id: WidgetDefaults.shared.postWidget.id),
                       for: Post.self)
            switch currentTab {
            case .favorites: router.favorites.add(.post(post))
            case .settings:  router.settings.add(.post(post))
            case .stories:   router.posts.add(.post(post))
            }
        }
    }
}
