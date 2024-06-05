//
//  ButtonFavorite.swift
//  HNApp
//
//  Created by piro2 on 5/31/24.
//

import SwiftUI

struct ButtonFavorite: View {
    var action: (Bool) -> ()
    
    // MARK: - Private
    @State private var isSelected: Bool
    
    // MARK: - Init
    init(isSelected: Bool, action: @escaping (Bool) -> ()) {
        self._isSelected = State(initialValue: isSelected)
        self.action = action
    }
    
    // MARK: - Body
    var body: some View {
        HapticButton {
            action(isSelected)
            isSelected.toggle()
        } label: {
            Image(systemName: "bookmark.fill")
                .foregroundColor(isSelected ? AppColor.main.color : .mainLightText)
        }
    }
}
