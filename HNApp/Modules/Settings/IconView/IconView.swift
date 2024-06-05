//
//  IconView.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/28/24.
//

import SwiftUI

struct IconView: View {
    @Binding var currentLogo: AppTheme.Logo
    
    var action: (AppTheme.Logo) -> ()
    
    // MARK: - Body
    var body: some View {
        GeometryReader { proxy in
            let itemWidth = proxy.size.height * 1
            let itemHPadding = (proxy.size.width - itemWidth) / 2
            let itemSpacing = itemHPadding / 4
            
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: itemSpacing) {
                        ForEach(AppTheme.Logo.allCases, id: \.self) { logo in
                            image(for: logo, width: itemWidth)
                        }
                        .onAppear() {
                            withAnimation {
                                proxy.scrollTo(currentLogo, anchor: .center)
                            }
                        }
                    }
                    .scrollTargetLayout()
                }
            }
            .scrollTargetBehavior(.viewAligned)
            .padding(.vertical)
            .safeAreaPadding(.horizontal, itemHPadding)
        }
    }
}

// MARK: - Private
private extension IconView {
    var checkmark: some View {
        Image(systemName: "checkmark.circle.fill")
            .resizable()
            .renderingMode(.template)
            .foregroundStyle(Color.mainLightText)
            .padding([.top, .trailing], Const.checkmarkPadding)
            .frame(width: Const.checkmarkWidth, height: Const.checkmarkWidth)
    }
    
    func image(for logo: AppTheme.Logo, width: CGFloat) -> some View {
        logo.image
            .resizable()
            .overlay() {
                VStack {
                    HStack {
                        Spacer()
                        checkmark
                    }
                    Spacer()
                }
                .opacity(logo == currentLogo ? 1 : .zero)
            }
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: Const.imageCornerRadius))
            .frame(width: width)
            .id(logo)
            .tapWithAnimation { action(logo) }
            .scrollTransition(.animated, axis: .horizontal) { content, phase in
                content
                    .opacity(phase.isIdentity ? 1.0 : Const.imageTransitionOpadcity)
                    .scaleEffect(phase.isIdentity ? 1.0 : Const.imageTransitionScale)
                    .blur(radius: phase.isIdentity ? .zero : Const.imageTransitionBlur)
            }
    }
}

// MARK: - Preview
#Preview {
    IconView(currentLogo: .constant(.logo1), action: { _ in })
        .frame(height: 200)
}

// MARK: - Constants
fileprivate struct Const {
    static let checkmarkWidth: CGFloat = 32
    static let checkmarkPadding: CGFloat = 8
    
    static let imageCornerRadius: CGFloat = 16
    static let imageTransitionOpadcity: CGFloat = 0.8
    static let imageTransitionScale: CGFloat = 0.8
    static let imageTransitionBlur: CGFloat = 2
}
