//
//  PDState.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/27/24.
//

import Foundation

enum PDState {
    case loaded, loading, noComments, error(Error)
}
