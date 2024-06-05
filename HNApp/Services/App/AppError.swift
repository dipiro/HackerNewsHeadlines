//
//  AppError.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/13/24.
//

import Foundation

enum AppError {
    enum NetworkError: Error {
        case invalidServerResponseError
        case invalidUrl
    }
    
    enum WidgetError: Error {
        case notFoundId
    }
}
