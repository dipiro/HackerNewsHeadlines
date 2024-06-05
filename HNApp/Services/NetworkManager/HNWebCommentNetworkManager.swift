//
//  HNWebCommentNetworkManager.swift
//  HNApp
//
//  Created by piro2 on 5/29/24.
//

import Foundation

final class HNWebCommentNetworkManager: HNWebCommentsNetworking {
    var urlString: String = AppConstant.Link.hnWebBaseUrl

    // MARK: - Private 
    private let session = URLSession.shared
    
    // MARK: - Func
    func fetchComments(by postId: Int) async throws -> String {
        guard let url = URL(string: "\(urlString)item?id=\(postId)") else {
            throw AppError.NetworkError.invalidUrl
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard 
            let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200,
            let html = String(data: data, encoding: .utf8)
        else {
            throw AppError.NetworkError.invalidServerResponseError
        }
        
        return html
    }
}
