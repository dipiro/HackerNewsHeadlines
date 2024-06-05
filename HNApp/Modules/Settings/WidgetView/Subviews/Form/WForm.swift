//
//  WForm.swift
//  HNApp
//
//  Created by piro2 on 5/28/24.
//

import SwiftUI

struct WForm<Item: Hashable & Identifiable, Label: View>: View {
    var items: [Item]
    var label: (Item) -> Label
    
    // MARK: - Body
    var body: some View {
        Form {
            ForEach(items) { item in
                label(item)
                    .listRowBackground(Color.block)
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.background)
    }
}
