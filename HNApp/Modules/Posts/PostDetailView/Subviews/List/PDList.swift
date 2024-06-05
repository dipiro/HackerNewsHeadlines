//
//  PDList.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/22/24.
//

import SwiftUI

struct PDList<T: Hashable & Identifiable, Label: View, Header: View>: View {
    var items: [T]
    var label: (T) -> Label
    @ViewBuilder var header: () -> Header
    
    // MARK: - Body
    var body: some View {
        List() {
            Section {
                ForEach(items) { item in
                    label(item)
                        .id(item)
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            } header: {
                header()
            }
        }
        .listStyle(.grouped)
        .scrollContentBackground(.hidden)
        .background(Color.background)
    }
}

