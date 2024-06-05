//
//  PostWebView.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/16/24.
//

import SwiftUI

struct PostWebView: View {
    var model: ShareModel
    
    // MARK: - Private
    @Environment(TBStateViewModel.self) private var tabBarState
    
    // MARK: - Body
    var body: some View {
        WebView(url: model.url)
            .toolbar { toolbar }
            .onChange(of: tabBarState.state) { tabBarState.hide() }
            .navigationTitle(model.url.host() ?? "")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.background)
            .ignoresSafeArea(.all, edges: .bottom)
    }
}

// MARK: - Private Extension
private extension PostWebView {
    var toolbar: some ToolbarContent {
        ToolbarItemGroup(placement: .topBarTrailing) {
            ButtonShare(model: model)
            ButtonSafariLink(url: model.url)
        }
    }
}
