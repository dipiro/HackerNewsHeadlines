//
//  Dictionary+.swift
//  HNApp
//
//  Created by piro2 on 5/30/24.
//

import Foundation

extension Dictionary: RawRepresentable where Key: Codable, Value: Codable {
    public init?(rawValue: String) {
        guard
            let data = rawValue.data(using: .utf8),
            let result = try? JSONDecoder().decode([Key: Value].self, from: data)
        else { return nil }
        self = result
    }

    public var rawValue: String {
        guard
            let data = try? JSONEncoder().encode(self),
            let result = String(data: data, encoding: .utf8)
        else { return "{}" }
        return result
    }
}
