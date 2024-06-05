//
//  BrowserType.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/28/24.
//

import Foundation

enum BrowserType: String, CaseIterable, Identifiable  {
    case safari = "Safari",
         defaultBrowser = "Default Browser"
    
    var id: Self { self }
}
