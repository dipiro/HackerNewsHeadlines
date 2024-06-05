//
//  NetworkManager.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/13/24.
//

import Foundation

final class HNApiNetworkManager: HNApiNetworking {
    let session = URLSession.shared
    let urlString: String = AppConstant.Link.hnApiBaseUrl
    
    func fetch<T>(by requestType: HNRequestType, for type: T.Type) async throws -> T where T: Hashable & Decodable {
        guard let url = URL(string: "\(urlString)\(requestType.pathString)") else {
            throw AppError.NetworkError.invalidUrl
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw AppError.NetworkError.invalidServerResponseError
        }
        
        let results = try JSONDecoder().decode(T.self, from: data)
        
        return results
    }
}
