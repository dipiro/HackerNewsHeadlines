//
//  SMenuCell.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/28/24.
//

import SwiftUI

struct SMenuCell<Item: Hashable & Identifiable, Description: StringProtocol, Label: View>: View {
    var description: Description
    var items: [Item]
    var action: (Item) -> ()
    var label: () -> Label
    
    // MARK: - Init
    init(_ description: Description, items: [Item], action: @escaping (Item) -> (), label: @escaping () -> Label) {
        self.description = description
        self.items = items
        self.action = action
        self.label = label
    }
    
    // MARK: - Body
    var body: some View {
        HStack {
            Text(description)
                .defaultSettings()
            Spacer()
            Menu {
                ForEach(items) { item in
                    Button { withAnimation { action(item) } } label: {
                        Text(String(describing: item)
                            .addingSpacesBeforeCapitalLetters()
                            .capitalized
                        )
                    }
                }
            } label: {
                label()
            }
            .tint(AppColor.main.color)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
}
