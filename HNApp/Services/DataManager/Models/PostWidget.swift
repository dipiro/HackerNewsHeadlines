//
//  PostWidget.swift
//  HNApp
//
//  Created by piro2 on 6/1/24.
//

import Foundation

struct PostWidget: Codable, Hashable, Identifiable, RawRepresentable  {
    let id: Int
    let title: String
    let by: String
    let time: Double?
    let url: URL?
    
    // MARK: - Init
    init(id: Int, title: String, by: String, time: Double?, url: URL?) {
        self.id = id
        self.title = title
        self.by = by
        self.time = time
        self.url = url
    }
    
    init(from post: Post) {
        self.init(id: post.id, title: post.title, by: post.by, time: post.time, url: post.url)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.by = try container.decode(String.self, forKey: .by)
        self.url = try container.decodeIfPresent(URL.self, forKey: .url)
        self.time = try container.decodeIfPresent(Double.self, forKey: .time)
    }
}

// MARK: - Public
extension PostWidget {
    enum CodingKeys: CodingKey {
        case id, title, by, url, time
    }
    
    var displayHost: String? {
        url?.host()
    }
    
    var createdTime: String {
        let formatter = DateComponentsFormatter.cached([.hour, .day, .weekOfMonth, .month, .year])
        let timeString = formatter.string(from: Date(timeIntervalSince1970: time ?? .zero), to: Date())
        
        return timeString ?? ""
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(by, forKey: .by)
        try container.encode(url, forKey: .url)
        try container.encode(time, forKey: .time)
    }
}

// MARK: - Extension
extension PostWidget {
    init?(rawValue: String) {
        guard
            let data = rawValue.data(using: .utf8),
            let result = try? JSONDecoder().decode(Self.self, from: data)
        else { return nil }
        self = result
    }

    var rawValue: String {
        guard
            let data = try? JSONEncoder().encode(self),
            let result = String(data: data, encoding: .utf8)
        else { return "" }
        return result
    }
}
