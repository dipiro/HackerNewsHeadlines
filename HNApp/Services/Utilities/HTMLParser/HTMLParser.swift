//
//  HTMLParser.swift
//  HNApp
//
//  Created by piro2 on 5/29/24.
//

import Foundation
import SwiftSoup

final class HTMLParser {
    
}

// MARK: - Public
extension HTMLParser {
    func parseComments(html: String) async -> [Comment] {
        do {
            let document = try SwiftSoup.parse(html)
            let commentElements = try document.select(".comtr")
            
            return try commentElements.map { try extractCommentDetails(from: $0) }
        } catch {
            print("Error parsing HTML: \(error)")
            return []
        }
    }
}

// MARK: - Private
private extension HTMLParser {
    func sanitizeComment(elements: Elements) throws -> String {
        if let replyElement = try? elements.select(".reply") {
            try replyElement.html("")
        }
        
        if let links = try? elements.select("a") {
            try links.forEach { link in
                if let url = try? link.attr("href") {
                    try link.html(url)
                }
            }
        }
        
        return try elements.html()
    }
    
    func extractCommentDetails(from element: Element) throws -> Comment {
        let text = try sanitizeComment(elements: element.select(".commtext"))
        let age = try element.select(".age").text()
        let user = try element.select(".hnuser").text()
        
        guard
            let id = Int(try element.attr("id")),
            let indentWidth = Int(try element.select(".ind img").attr("width"))
        else {
            throw Exception.Error(type: .SelectorParseException, Message: "Couldn't parse comment")
        }
        
        let level = indentWidth / 40
        
        return Comment(id: id, 
                       timePeriod: age,
                       text: text,
                       author: user,
                       level: level)
    }
}
