//
//  MetadataCache.swift
//  HackerNewsSwiftUI
//
//  Created by piro2 on 5/15/24.
//

import LinkPresentation

struct MetadataCache {
    private var userDefaults = UserDefaults.standard
    
    // MARK: - Func 
    func cache(metadata: LPLinkMetadata) {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: metadata, requiringSecureCoding: true)
            userDefaults.setValue(data, forKey: metadata.url!.absoluteString)
        } catch let error {
            print("Error when caching metadata: \(error.localizedDescription)")
        }
    }
    
   func get(urlString: String) -> LPLinkMetadata? {
       guard let data = userDefaults.object(forKey: urlString) as? Data else { return nil }
       
        do {
            return try NSKeyedUnarchiver.unarchivedObject(ofClass: LPLinkMetadata.self, from: data)
        } catch let error {
            print("Error when unarchive metadata: \(error.localizedDescription)")
            return nil
        }
    }
}
