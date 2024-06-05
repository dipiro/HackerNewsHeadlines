//
//  WidgetDefaults.swift
//  HNApp
//
//  Created by piro2 on 5/29/24.
//

import Foundation
import SwiftUI
import WidgetKit

public class WidgetDefaults: ObservableObject {
    public static let shared = WidgetDefaults()

    @AppStorage("postWidget", store: UserDefaults(suiteName: AppConstant.Const.appGroupName))
    var postWidget: PostWidget = PostWidget.preview
    
    @AppStorage("widgetBackgroundColorHex", store: UserDefaults(suiteName: AppConstant.Const.appGroupName))
    var widgetBackgroundColorHex: String = (Color(#colorLiteral(red: 0.07058823529, green: 0.07058823529, blue: 0.07058823529, alpha: 1)).toHex() ?? "")
    
    @AppStorage("widgetTextColorHex", store: UserDefaults(suiteName: AppConstant.Const.appGroupName))
    var widgetTextColorHex: String = (Color(#colorLiteral(red: 0.8549019608, green: 0.8549019608, blue: 0.8549019608, alpha: 1)).toHex() ?? "")
}
