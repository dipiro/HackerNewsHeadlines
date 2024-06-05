//
//  SettingsView.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/14/24.
//

import Foundation
import SwiftUI
import StoreKit
import MessageUI

struct SettingsView: View {
    @Environment(\.modelContext) var context
    @Environment(\.requestReview) var requestReview
    @Environment(\.openURL) var openURL
    @Environment(RouterManager.self) private var router
    @Default(\.browserType) private var browserType
    @Default(\.currentLogoType) private var currentLogoType
    @Default(\.mainColorHex) private var mainColorHex
    
    @State private var result: Result<MFMailComposeResult, Error>? = nil
    private var alternateIconManager = AlternateIconsManager()
    
    // MARK: - Body
    var body: some View {
        NavigationStack(path: Bindable(router).settings.routes) {
            SForm(label: setupCell)
                .navigationTitle("Settings")
                .sheet(item: Bindable(router).settings.sheet, content: destinationHandler)
                .navigationDestination(for: router.settings.type, destination: destinationHandler)
        }
        .onChange(of: currentLogoType) {
            alternateIconManager.changeIcon(on: currentLogoType.rawValue)
        }
        .tint(Color.mainLightText)
    }
}

// MARK: - Private
private extension SettingsView {
    @ViewBuilder func setupCell(type: SRowType) -> some View {
        switch type {
        case .about:
            SAboutCell(currentLogoType: $currentLogoType)
        case .icon:
            SDestinationCell(type.rawValue) { router.settings.sheet = .icon }
        case .widget:
            SDestinationCell(type.rawValue) { router.settings.add(.widget) }
        case .feedback:
            SDestinationCell(type.rawValue) { router.settings.sheet = .mail }
        case .github:
            SDestinationCell(type.rawValue) { openURL(URL(string:  AppConstant.Link.myGitHubUrl)!) }
        case .rate:
            SDestinationCell(type.rawValue) { requestReview() }
        case .color:
            SColorCell(type.rawValue, colorHex: $mainColorHex)
        case .openLink:
            SMenuCell(type.rawValue, items: BrowserType.allCases) { item in
                browserType = item
            } label: {
                Text(browserType.rawValue)
                    .defaultSettings(color: AppColor.main.color)
            }
        }
    }
    
    @ViewBuilder func destinationHandler(_ type: RouterSettings.SettingsRoute) -> some View  {
        switch type {
        case .icon:
            IconView(currentLogo: $currentLogoType) { logo in
                currentLogoType = logo
            }
            .presentationDetents([.fraction(0.20)])
            .presentationDragIndicator(.hidden)
        case .widget:
            WidgetView()
        case .mail:
            MailView(result: self.$result)
                .ignoresSafeArea()
        case .post(let post):
            PostDetailView(post: post, context: context, from: .posts)
        case .webView(let shareModel):
            PostWebView(model: shareModel)
        }
    }
}
