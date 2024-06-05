//
//  WViewModel.swift
//  HNApp
//
//  Created by piro2 on 5/28/24.
//

import Foundation
import Observation
import WidgetKit

@Observable
class WViewModel {
    var bgColorHex: String = WidgetDefaults.shared.widgetBackgroundColorHex
    var textColorHex: String = WidgetDefaults.shared.widgetTextColorHex
    
    // MARK: - Private
    private(set) var post: Post
    
    // MARK: - Init
    init(post: Post) {
        self.post = post
        self.bgColorHex = bgColorHex
        self.textColorHex = textColorHex
    }
    
    // MARK: - Func
    func save() {
//        var newSettings = WidgetDefaults.shared.widgetSettings
        //        newSettings.widgetBackgroundColorHex = bgColorHex
        //        newSettings.widgetTextColorHex = textColorHex
        //
        //
        //        WidgetDefaults.shared.widgetSettings = newSettings
        
        WidgetDefaults.shared.widgetTextColorHex = textColorHex
        WidgetDefaults.shared.widgetBackgroundColorHex = bgColorHex
        WidgetCenter.shared.reloadAllTimelines()
    }
}
