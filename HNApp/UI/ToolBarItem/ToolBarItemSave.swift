//
//  ToolBarItemSave.swift
//  HNApp
//
//  Created by piro2 on 5/28/24.
//

import SwiftUI

struct ToolBarItemSave: ToolbarContent {
    let action: () -> Void
    
    // MARK: - Body
    var body: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            HapticButton(action: { action() }, label: {
                Text("Save")
                    .defaultSettings(weight: .medium)
            })
        }
    }
}
