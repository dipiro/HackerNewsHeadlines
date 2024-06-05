//
//  SColorCell.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/28/24.
//

import SwiftUI

struct SColorCell<Description: StringProtocol>: View {
    @Binding var colorHex: String
    var description: Description
    
    // MARK: - Private
    @State private var color: Color
    
    // MARK: - Init
    init(_ description: Description, colorHex: Binding<String>) {
        self._colorHex = colorHex
        self.description = description
        self._color = State(initialValue: Color(hex: colorHex.wrappedValue) ?? .orange)
    }
    
    // MARK: - Body
    var body: some View {
        ColorPicker(selection: $color, supportsOpacity: false) {
            Text(description)
                .defaultSettings()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .onChange(of: color) {
            colorHex = color.toHex() ?? ""
        }
    }
}
