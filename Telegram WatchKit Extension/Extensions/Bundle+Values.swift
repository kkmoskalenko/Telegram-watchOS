//
//  Bundle+Values.swift
//  Telegram WatchKit Extension
//
//  Created by Konstantin Moskalenko on 09.03.2021.
//

import Foundation

extension Bundle {
    var appVersion: String? {
        let key = "CFBundleShortVersionString"
        return object(forInfoDictionaryKey: key) as? String
    }
    
    var apiHash: String? {
        object(forInfoDictionaryKey: "API_HASH") as? String
    }
    
    var apiId: Int? {
        guard let value = object(forInfoDictionaryKey: "API_ID") as? String else {
            return nil
        }
        
        return Int(value)
    }
}
