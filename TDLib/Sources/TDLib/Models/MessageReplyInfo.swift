//
//  MessageReplyInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Contains information about replies to a message
public struct MessageReplyInfo: Codable {

    /// Identifier of the last reply to the message
    public var lastMessageId: Int64

    /// Identifier of the last read incoming reply to the message
    public var lastReadInboxMessageId: Int64

    /// Identifier of the last read outgoing reply to the message
    public var lastReadOutboxMessageId: Int64

    /// Recent repliers to the message; available in channels with a discussion supergroup
    public var recentRepliers: [MessageSender]

    /// Number of times the message was directly or indirectly replied
    public var replyCount: Int


    public init (
        lastMessageId: Int64,
        lastReadInboxMessageId: Int64,
        lastReadOutboxMessageId: Int64,
        recentRepliers: [MessageSender],
        replyCount: Int) {

        self.lastMessageId = lastMessageId
        self.lastReadInboxMessageId = lastReadInboxMessageId
        self.lastReadOutboxMessageId = lastReadOutboxMessageId
        self.recentRepliers = recentRepliers
        self.replyCount = replyCount
    }
}

