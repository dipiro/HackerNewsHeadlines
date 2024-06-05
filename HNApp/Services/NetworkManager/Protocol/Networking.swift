//
//  Networking.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/13/24.
//

import Foundation

protocol Networking {    
    var urlString: String { get }
}

protocol HNApiNetworking: Networking {
    func fetch<T>(by requestType: HNRequestType, for type: T.Type) async throws -> T where T: Hashable & Decodable
}

protocol HNWebCommentsNetworking: Networking {
    func fetchComments(by postId: Int) async throws -> String 
}
