//
//  HNAppWidget.swift
//  HNApp
//
//  Created by piro2 on 5/29/24.
//

import WidgetKit
import SwiftUI

struct HNAppWidget: Widget {
    let kind: String = "HNAppWidget"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind,
                               intent: ConfigurationAppIntent.self,
                               provider: Provider()) { entry in
            WidgetContentView(entry: entry)
                .containerBackground(.red, for: .widget)
                .widgetURL(URL(string: AppConstant.DeepLink.lastSavedPost))
        }
                               .supportedFamilies([.systemSmall])
                               .contentMarginsDisabled()
    }
}
