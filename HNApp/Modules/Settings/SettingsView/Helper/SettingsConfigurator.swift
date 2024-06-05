//
//  SettingsSectionConfigurator.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/16/24.
//

import Foundation

final class SettingsConfigurator {
    static let sections: [SSectionType] = [
        .info([.about, .feedback, .rate, .github]),
        .customization([.widget, .icon, .color]),
        .interface([.openLink])
    ]
}
