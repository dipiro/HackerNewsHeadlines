//
//  Binding+toUnwrapped.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/18/24.
//

import Foundation
import SwiftUI

extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue },
                   set: { self.wrappedValue = $0 })
    }
}
