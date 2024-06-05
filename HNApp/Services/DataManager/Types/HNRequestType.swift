//
//  HNRequestType.swift
//  HNApp
//
//  Created by piro2 on 5/29/24.
//

import Foundation

enum HNRequestType: Hashable {
    case stories(type: HNCategoryType)
    case story(id: Int)
}

// MARK: - Public
extension HNRequestType {
    var pathString: String {
        switch self {
        case .stories(let type):
            var path = ""
            switch type {
            case .top:  path = "topstories"
            case .new:  path = "newstories"
            case .best: path = "beststories"
            case .ask:  path = "askstories"
            case .show: path = "showstories"
            case .job:  path = "jobstories"
            }
            path += query
            return path
        case .story(let id):
            return "item/\(id)\(query)"
        }
    }
}

// MARK: - Private
private extension HNRequestType {
    private var query: String {
        ".json?print=pretty"
    }
}
