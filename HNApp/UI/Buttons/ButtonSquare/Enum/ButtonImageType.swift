//
//  ButtonSquareType.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/14/24.
//

import Foundation
import SwiftUI

enum ButtonImageType {
    case save, safari, share, back, custom(_ image: Image), customSystemName(_ imageSystemName: String)
    
    // MARK: - Properties
    var image: Image {
        switch self {
        case .save:
            return Image(systemName: "bookmark")
        case .safari:
            return Image(systemName: "safari.fill")
        case .share:
            return Image(systemName: "square.and.arrow.up.fill")
        case .back:
            return Image(systemName: "arrowshape.backward.fill")
        case .custom(let image):
            return image
        case .customSystemName(let systemName):
            return Image(systemName: systemName)
        }
    }
}
