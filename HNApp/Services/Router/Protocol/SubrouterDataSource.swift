//
//  RouterDataSource.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/19/24.
//

import Foundation
import SwiftUI

protocol RouterDataSource {
    associatedtype T

    var sheet: T? { get set }
    var full: T? { get set }
    var routes: [T] { get }
    var type: T.Type { get }
    
    func add(_ route: T)
    func removeLast()
}

