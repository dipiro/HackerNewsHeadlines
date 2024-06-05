//
//  ButtonShrinkStyle.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/15/24.
//

import SwiftUI

struct ButtonShrinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .buttonStyle(.borderless)
            .foregroundColor(Color.accentColor)
            .scaleEffect(configuration.isPressed ? Const.scaleEffectOn : Const.scaleEffectOff)
            .animation(.easeIn(duration: Const.animationDuration), value: configuration.isPressed)
    }
}

// MARK: - Constants
fileprivate struct Const {
    static let scaleEffectOn: CGFloat = 0.75
    static let scaleEffectOff: CGFloat = 1
    static let animationDuration: CGFloat = 0.2
}
