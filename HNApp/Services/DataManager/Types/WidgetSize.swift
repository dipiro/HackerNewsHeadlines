//
//  WidgetSize.swift
//  HNApp
//
//  Created by piro2 on 5/30/24.
//

import Foundation

enum WidgetSize {
    case small(device: DeviceSize)
}

// MARK: - Public
extension WidgetSize {
    var size: CGSize {
        switch self {
        case .small(let device):
            switch device {
            case .proMax:       return .init(width: 170, height: 170)
            case .plus:         return .init(width: 170, height: 170)
            case .three:        return .init(width: 169, height: 169)
            case .eightPlus:    return .init(width: 159, height: 159)
            case .pro:          return .init(width: 158, height: 158)
            case .basic:        return .init(width: 158, height: 158)
            case .mini:         return .init(width: 155, height: 155)
            case .eight:        return .init(width: 148, height: 148)
            case .nine:         return .init(width: 155, height: 155)
            case .se:           return .init(width: 141, height: 141)
            }
        }
    }
}
