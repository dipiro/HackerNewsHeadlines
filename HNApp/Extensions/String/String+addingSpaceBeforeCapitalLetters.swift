//
//  String+addingSpaceBeforeCapitalLetters.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/28/24.
//

import Foundation

extension String {
    func addingSpacesBeforeCapitalLetters() -> String {
        let pattern = "([a-z])([A-Z])"
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        
        let modifiedString = regex?.stringByReplacingMatches(in: self,
                                                             options: [],
                                                             range: NSRange(location: 0, length: self.count),
                                                             withTemplate: "$1 $2")
        
        return modifiedString ?? self
    }
}
