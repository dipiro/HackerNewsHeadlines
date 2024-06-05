//
//  ErrorView.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/25/24.
//

import SwiftUI

struct ErrorView: View {
    var error: Error
    
    // MARK: - Init
    init(_ error: Error) {
        self.error = error
    }
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: Const.spacing) {
            AppTheme.Icon.error.image
                .resizable()
                .renderingMode(.template)
                .frame(width: Const.iconWidth, height: Const.iconWidth, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.mainLightText)
            Text("Something Went Wrong")
                .defaultSettings(weight: .bold, style: .title3, color: Color.mainLightText)
        }
        .onAppear() {
            let _ = print("Error: \(error.localizedDescription)")
        }
    }
}

// MARK: - Const
fileprivate struct Const {
    static let spacing: CGFloat = 8
    static let iconWidth: CGFloat = 72
}

// MARK: - Preview
#Preview {
    ErrorView(AppError.NetworkError.invalidServerResponseError)
}
