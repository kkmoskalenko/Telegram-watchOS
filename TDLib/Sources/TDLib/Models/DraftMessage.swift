//
//  DraftMessage.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Contains information about a message draft
public struct DraftMessage: Codable {

    /// Point in time (Unix timestamp) when the draft was created
    public var date: Int

    /// Content of the message draft; this should always be of type inputMessageText
    public var inputMessageText: InputMessageContent

    /// Identifier of the message to reply to; 0 if none
    public var replyToMessageId: Int64


    public init (
        date: Int,
        inputMessageText: InputMessageContent,
        replyToMessageId: Int64) {

        self.date = date
        self.inputMessageText = inputMessageText
        self.replyToMessageId = replyToMessageId
    }
}

