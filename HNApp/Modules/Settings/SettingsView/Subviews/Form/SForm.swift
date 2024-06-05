//
//  SList.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/16/24.
//

import SwiftUI

struct SForm<Label: View>: View {
    var sections = SettingsConfigurator.sections
    
    var label: (SRowType) -> Label
    
    // MARK: - Body
    var body: some View {
        Form {
            ForEach(sections) { section in
                Section(section.title) {
                    ForEach(section.rows) { cell in
                        label(cell)
                            .listRowBackground(Color.block)
                    }
                }
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.background)
    }
}
