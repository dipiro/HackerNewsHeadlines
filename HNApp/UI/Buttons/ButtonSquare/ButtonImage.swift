//
//  ButtonSquare.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/14/24.
//

import SwiftUI

struct ButtonImage: View {
    @State var isSelected: Bool = false
    
    var type: ButtonImageType
    var padding: CGFloat = 10
    var cornerRadius: CGFloat = 12
    var aspectRatio: CGFloat = 1.5
    var color: Color = .block
    var colorIcon: Color = .mainLightText
    var isAnimated: Bool = true
    var animation: Animation = .easeIn(duration: 0.2)
    var isSelectable: Bool = false
    var action: (ButtonImageType) -> ()
    
    init(type: ButtonImageType,
         padding: CGFloat = 10,
         cornerRadius: CGFloat = 12,
         aspectRatio: CGFloat = 1.5,
         color: Color = .block,
         colorIcon: Color = .mainLightText,
         isAnimated: Bool = true,
         animation: Animation = Animation.easeIn(duration: 0.2),
         isSelectable: Bool = false,
         isSelected: Bool = false,
         action: @escaping (ButtonImageType) -> Void) {
        self.type = type
        self.padding = padding
        self.cornerRadius = cornerRadius
        self.aspectRatio = aspectRatio
        self.color = color
        self.colorIcon = colorIcon
        self.isAnimated = isAnimated
        self.animation = animation
        self.isSelectable = isSelectable
        self._isSelected = State(initialValue: isSelected)
        self.action = action
    }
    
    init(type: ButtonImageType, 
         colorIcon: Color = .mainLightText,
         aspectRatio: Int = 1,
         isAnimated: Bool = true,
         animation: Animation = Animation.easeIn(duration: 0.2),
         isSelectable: Bool = false,
         isSelected: Bool = false,
         action: @escaping (ButtonImageType) -> Void) {
        self.type = type
        self.padding = .zero
        self.cornerRadius = .zero
        self.aspectRatio = 1
        self.color = .clear
        self.colorIcon = colorIcon
        self.isAnimated = isAnimated
        self.animation = animation
        self.isSelectable = isSelectable
        self._isSelected = State(initialValue: isSelected)
        self.action = action
    }
    
    // MARK: - Init
    var body: some View {
        HapticButton {
            if isSelectable {
                isSelected.toggle()
            }
            
            if isAnimated {
                withAnimation(animation) { action(type) }
            } else {
                action(type)
            }
        } label: {
            type.image
                .resizable()
                .scaledToFit()
                .padding(padding)
                .foregroundColor(isSelectable && isSelected ? .orange : colorIcon)
                .background {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(color)
                }
        }
        .aspectRatio(aspectRatio, contentMode: .fit)
    }
}
