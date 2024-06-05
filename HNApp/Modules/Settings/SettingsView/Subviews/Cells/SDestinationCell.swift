//
//  SDestinationCell.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/27/24.
//

import SwiftUI

struct SDestinationCell<Description: StringProtocol>: View {
    var description: Description
    var action: VoidHandler
    
    // MARK: - Init
    init(_ description: Description, action: @escaping VoidHandler) {
        self.description = description
        self.action = action
    }
    
    // MARK: - Body
    var body: some View {
        HStack {
            Text(description)
                .defaultSettings()
            Spacer()
            Image(systemName: "chevron.forward")
                .renderingMode(.template)
                .foregroundStyle(AppColor.main.color)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .onTapGesture {
            action()
        }
    }
}
