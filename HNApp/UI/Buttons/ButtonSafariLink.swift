//
//  SafariLink.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/27/24.
//

import Foundation
import SwiftUI

struct ButtonSafariLink: View {
    var url: URL
    
    //MARK: - Body
    var body: some View {
        Link(destination: url) {
            Image(systemName: "safari.fill")
        }
    }
}
