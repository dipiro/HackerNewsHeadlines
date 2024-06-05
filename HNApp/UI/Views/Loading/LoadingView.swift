//
//  LoadingImage.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/14/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        HStack {
            VStack(spacing: 8) {
                ProgressView()
                    .tint(.mainSubLightText)
                Text("Loading...")
                    .defaultSettings(style: .caption, color: .mainSubLightText)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}
