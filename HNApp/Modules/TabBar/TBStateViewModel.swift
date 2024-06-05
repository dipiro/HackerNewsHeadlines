//
//  TabBarState.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/21/24.
//

import Foundation
import SwiftUI
import Observation

@Observable
final class TBStateViewModel {
    var state: TBStateType = .withTabBar
    
    func toggleTabBarState(_ newScreenIsPresented: Bool) {
        withAnimation(.easeInOut(duration: 0.25)) {
            state = newScreenIsPresented == true ? .withoutTabBar : .withTabBar
        }
    }
    
    func hide() {
        withAnimation(.easeInOut(duration: 0.25)) {
            state = .withoutTabBar
        }
    }
}
