//
//  CreateVoiceChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Creates a voice chat (a group call bound to a chat). Available only for basic groups and supergroups; requires can_manage_voice_chats rights
public struct CreateVoiceChat: Codable {

    /// Chat identifier
    public let chatId: Int64


    public init (chatId: Int64) {
        self.chatId = chatId
    }
}

