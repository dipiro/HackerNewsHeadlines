//
//  AppConstant.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/14/24.
//

import Foundation

enum AppConstant {
    enum Link {
        static let favIconDomain = "https://icons.duckduckgo.com/ip3/%@.ico"
        static let hnApiBaseUrl = "https://hacker-news.firebaseio.com/v0/"
        static let hnWebBaseUrl = "https://news.ycombinator.com/"
        static let myGitHubUrl = "https://github.com/dipiro/Hacker-Headlines"
    }
    
    enum Const {
        static let appGroupName = "group.com.dp.hn"
    }
    
    enum DeepLink {
        static let lastSavedPost = "myapp://lastSavedPost"
    }
    
    enum Mail {
        static let email = "d.piromnia@gmail.com"
        static let subject = "Hacker Headlines"
    }
}
