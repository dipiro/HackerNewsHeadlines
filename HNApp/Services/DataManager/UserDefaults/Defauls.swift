//
//  Defauls.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/28/24.
//

import Foundation
import SwiftUI

public class Defaults: ObservableObject {
    public static let shared = Defaults()
    
    @AppStorage("browserType") 
    var browserType = BrowserType.defaultBrowser
    
    @AppStorage("currentLogoType")
    var currentLogoType = AppTheme.Logo.logo1
    
    @AppStorage("mainColorHex")
    var mainColorHex = (Color(#colorLiteral(red: 1, green: 0.3725490196, blue: 0, alpha: 1)).toHex() ?? "")
}
