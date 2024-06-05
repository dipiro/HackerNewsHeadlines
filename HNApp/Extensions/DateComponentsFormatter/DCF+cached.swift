//
//  DateComponentsFormatter+cached.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/22/24.
//

import Foundation

extension DateComponentsFormatter {
    static func cached(_ allowedUnits: NSCalendar.Unit = [.minute, .hour, .day, .weekOfMonth, .month, .year]) -> DateComponentsFormatter {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = allowedUnits
        formatter.maximumUnitCount = 1
        
        return formatter
    }
}
