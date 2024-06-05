//
//  Post.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/13/24.
//

import Foundation
import SwiftData

@Model final class Post: Codable, Hashable, Identifiable {
    @Attribute(.unique) let id: Int
    let title: String
    let descendants: Int?
    let by: String
    let url: URL?
    let score: Int?
    let time: Double?
    let text: String?
        
    // MARK: - Init
    init(id: Int, title: String, descendants: Int?, by: String, url: URL?, score: Int?, time: Double?, text: String?) {
        self.id = id
        self.title = title
        self.descendants = descendants
        self.by = by
        self.url = url
        self.score = score
        self.time = time
        self.text = text
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.descendants = try container.decodeIfPresent(Int.self, forKey: .descendants)
        self.by = try container.decode(String.self, forKey: .by)
        self.url = try container.decodeIfPresent(URL.self, forKey: .url)
        self.score = try container.decodeIfPresent(Int.self, forKey: .score)
        self.time = try container.decodeIfPresent(Double.self, forKey: .time)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
    }
}

// MARK: - Public
extension Post {
    enum CodingKeys: CodingKey {
        case id, title, descendants, by, url, score, time, text
    }
    
    @Transient
    var displayHost: String? {
        url?.host()
    }
    
    @Transient
    var displayDescendants: String {
        String(descendants ?? .zero)
    }
    
    @Transient
    var displayScore: String {
        String(score ?? .zero)
    }
    
    @Transient
    var createdTime: String {
        let formatter = DateComponentsFormatter.cached()
        let timeString = formatter.string(from: Date(timeIntervalSince1970: time ?? .zero), to: Date())
        
        return timeString ?? ""
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(by, forKey: .by)
        try container.encode(descendants, forKey: .descendants)
        try container.encode(url, forKey: .url)
        try container.encode(score, forKey: .score)
        try container.encode(time, forKey: .time)
        try container.encode(text, forKey: .text)
    }
}

