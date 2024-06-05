//
//  Collection+distance.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/15/24.
//

import Foundation

extension Collection {
    func distance(to index: Index) -> Int { distance(from: startIndex, to: index) }
}
