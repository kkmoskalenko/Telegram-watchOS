//
//  TelegramService.swift
//  Telegram WatchKit Extension
//
//  Created by Konstantin Moskalenko on 08.03.2021.
//

import Foundation
import TDLib

class TelegramService {
    static let shared = TelegramService()
    
    let api = TdApi(client: TdClient())
    private var listeners = [UpdateListener]()
    
    func addListener(_ listener: UpdateListener) {
        listeners.append(listener)
    }
    
    func removeListener(_ listener: UpdateListener) {
        listeners.removeAll(where: { $0 === listener })
    }
    
    private init() {
        api.client.run {
            guard let update = try? self.api.decoder.decode(
                    Update.self, from: $0) else { return }
            self.listeners.forEach { $0.onUpdate(update) }
        }
        
        let query = SetLogVerbosityLevel(
            newVerbosityLevel: 0)
        api.client.execute(query: DTO(query))
    }
}

protocol UpdateListener: AnyObject {
    func onUpdate(_ update: Update)
}
