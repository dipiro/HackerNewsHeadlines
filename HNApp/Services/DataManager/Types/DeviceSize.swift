//
//  DeviceSize.swift
//  HNApp
//
//  Created by piro2 on 5/30/24.
//

import Foundation

enum DeviceSize: CaseIterable {
    case proMax, plus, three, eightPlus, pro, basic, mini, eight, nine, se
}

// MARK: - Public
extension DeviceSize {
    var deviceSize: CGSize {
        switch self {
        case .proMax:       return .init(width: 430, height: 932)
        case .plus:         return .init(width: 428, height: 926)
        case .three:        return .init(width: 414, height: 896)
        case .eightPlus:    return .init(width: 414, height: 736)
        case .pro:          return .init(width: 393, height: 852)
        case .basic:        return .init(width: 390, height: 844)
        case .mini:         return .init(width: 375, height: 812)
        case .eight:        return .init(width: 375, height: 667)
        case .nine:         return .init(width: 360, height: 780)
        case .se:           return .init(width: 320, height: 568)
        }
    }
}
