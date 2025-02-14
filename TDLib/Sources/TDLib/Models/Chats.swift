//
//  Chats.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Represents a list of chats
public struct Chats: Codable {

    /// List of chat identifiers
    public var chatIds: [Int64]

    /// Approximate total count of chats found
    public var totalCount: Int


    public init (
        chatIds: [Int64],
        totalCount: Int) {

        self.chatIds = chatIds
        self.totalCount = totalCount
    }
}

