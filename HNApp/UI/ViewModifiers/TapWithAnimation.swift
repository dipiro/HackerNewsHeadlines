//
//  TapWithAnimation.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/15/24.
//

import Foundation
import SwiftUI

struct TapWithAnimation: ViewModifier {
    var callback: () -> ()
    var animation: Animation? = .easeInOut(duration: 0.2)
    var isHaptic: Bool = true
    
    // MARK: - Body
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                if isHaptic {
                    let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                    impactHeavy.impactOccurred()
                }
                withAnimation(animation) {
                    callback()
                }
            }
    }
}

// MARK: - Extensions
extension View {
    func tapWithAnimation(_ animation: Animation? = .bouncy, _ callback: @escaping () -> ()) -> some View {
        modifier(TapWithAnimation(callback: callback, animation: animation))
    }
}
