//
//  StringHandler.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/22/24.
//

import Foundation
import SwiftUI

final class StringHandler {
    func handleString(_ text: String?) -> AttributedString {
        guard let text = text, !text.isEmpty else { return AttributedString(text ?? "") }
        
        let processedText = text.replacingOccurrences(of: "<p>", with: "<p><p>")
        
        guard let data = processedText.data(using: .utf8) else { return AttributedString(text) }
        
        guard let nsAttributedString = try? NSAttributedString(
            data: data,
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ],
            documentAttributes: nil
        ) else {
            return AttributedString(text)
        }
        
        do {
            let attributedString = try AttributedString(nsAttributedString, including: \.swiftUI)
            return attributedString
        } catch {
            print("Error converting NSAttributedString to AttributedString: \(error)")
            return AttributedString(text)
        }
    }
}
