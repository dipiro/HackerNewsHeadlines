//
//  HackerNewsSwiftUIApp.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/13/24.
//

import SwiftUI
import SwiftData

@main
struct HNApp: App {
    @State private var router = RouterManager()
    @State private var tabBarState = TBStateViewModel()
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .modelContainer(DataContainer.shared.sharedModelContainer)
                .preferredColorScheme(.dark)
                .environment(router)
                .environment(tabBarState)
        }
    }
    
    // MARK: - Init
    init() {
        print("URL PATH TO SWIFT DATA: \(URL.applicationSupportDirectory.path(percentEncoded: false))")
    }
}
