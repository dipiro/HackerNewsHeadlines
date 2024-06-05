//
//  AppIntent.swift
//  HNAppWidget
//
//  Created by piro2 on 5/28/24.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Select story"
    static var description = IntentDescription("Select the story to open")
}
