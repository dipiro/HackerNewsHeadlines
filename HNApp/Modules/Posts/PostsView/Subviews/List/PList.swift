//
//  PList.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/15/24.
//

import SwiftUI

struct PList<T: Hashable & Identifiable, Label: View, Sublabel: View, Overlabel: View>: View {
    @Binding var items: [T]
    
    var label: (T) -> Label
    var overlabel: () -> Overlabel
    @ViewBuilder  var sublabel: () -> Sublabel
    
    // MARK: - Body
    var body: some View {
        List {
            overlabel()
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .padding(-16)
            ForEach(items) { item in
                label(item)
                    .id(item.id)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
            }
            sublabel()
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.background)
    }
}

