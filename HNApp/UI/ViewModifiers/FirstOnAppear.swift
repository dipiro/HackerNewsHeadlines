//
//  FirstOnAppear.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/23/24.
//

import SwiftUI

struct FirstOnAppear: ViewModifier {
    
    @State private var isLoaded = false
    private let action: VoidHandler?
    
    // MARK: - Init
    init(perform action: (() -> Void)? = nil) {
         self.action = action
     }
    
    // MARK: - Body
    func body(content: Content) -> some View {
        content
            .onAppear() {
                if !isLoaded {
                    isLoaded = true
                    action?()
                }
            }
    }
}

// MARK: - Extension
extension View {
    func firstOnAppear(perform action: (() -> Void)? = nil) -> some View {
        modifier(FirstOnAppear(perform: action))
    }
}
