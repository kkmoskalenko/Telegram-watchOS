//
//  BanChatMember.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Bans a member in a chat. Members can't be banned in private or secret chats. In supergroups and channels, the user will not be able to return to the group on their own using invite links, etc., unless unbanned first
public struct BanChatMember: Codable {

    /// Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days or for less than 30 seconds from the current time, the user is considered to be banned forever. Ignored in basic groups
    public let bannedUntilDate: Int

    /// Chat identifier
    public let chatId: Int64

    /// Pass true to delete all messages in the chat for the user. Always true for supergroups and channels
    public let revokeMessages: Bool

    /// Identifier of the user
    public let userId: Int


    public init (
        bannedUntilDate: Int,
        chatId: Int64,
        revokeMessages: Bool,
        userId: Int) {

        self.bannedUntilDate = bannedUntilDate
        self.chatId = chatId
        self.revokeMessages = revokeMessages
        self.userId = userId
    }
}

