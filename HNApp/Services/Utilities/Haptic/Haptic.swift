//
//  Haptic.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/15/24.
//

import SwiftUI

final class Haptic {
    let hapticHeavy = UIImpactFeedbackGenerator(style: .heavy)
    
    // MARK: - Func
    func activate() {
        hapticHeavy.impactOccurred()
    }
}
