//
//  ButtonHaptic.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/15/24.
//

import SwiftUI

struct HapticButton<Label: View>: View {
    var action: () -> ()
    var label: () -> Label
    var hapticIsActivated: Bool = true
    var haptic = Haptic()
    
    // MARK: - Body
    var body: some View {
        Button {
            haptic.activate()
            action()
        } label: {
            label()
        }
    }
}
