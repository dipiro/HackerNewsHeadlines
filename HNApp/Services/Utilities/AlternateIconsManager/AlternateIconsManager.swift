//
//  AlternateIconsManager.swift
//  HNApp
//
//  Created by piro2 on 6/1/24.
//

import Foundation
import SwiftUI

final class AlternateIconsManager {
    var iconNames: [String?] = []
}

// MARK: - Public
extension AlternateIconsManager {
    func getAlternateIconNames(){
        if let icons = Bundle.main.object(forInfoDictionaryKey: "CFBundleIcons") as? [String: Any],
           let alternateIcons = icons["CFBundleAlternateIcons"] as? [String: Any] {
            for (_, value) in alternateIcons{
                guard let iconList = value as? Dictionary<String,Any>,
                      let iconFiles = iconList["CFBundleIconFiles"] as? [String],
                      let icon = iconFiles.first
                else { return }
                iconNames.append(icon)
            }
        }
    }
    
    func changeIcon(on iconName: String) {
        if UIApplication.shared.supportsAlternateIcons {
            UIApplication.shared.setAlternateIconName(iconName) { error in
                if let error = error {
                    print("Error changing icon: \(error.localizedDescription)")
                }
            }
        }
    }
}
