//
//  WidgetDeterminingSize.swift
//  HNApp
//
//  Created by piro2 on 5/30/24.
//

import Foundation
import SwiftUI

class WidgetDeterminingSizeHelper {
    private let screenSize = UIScreen.screenSize
    private lazy var type = DeviceSize.allCases.first {
        $0.deviceSize == screenSize
    }
    
    var smallSize: CGSize {
        if let type = type {
            return WidgetSize.small(device: type).size
        } else {
            return WidgetSize.small(device: DeviceSize.basic).size
        }
    }
}
