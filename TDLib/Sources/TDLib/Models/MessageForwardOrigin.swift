//
//  MessageForwardOrigin.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Contains information about the origin of a forwarded message
public enum MessageForwardOrigin: Codable {

    /// The message was originally sent by a known user
    case messageForwardOriginUser(MessageForwardOriginUser)

    /// The message was originally sent by an anonymous chat administrator on behalf of the chat
    case messageForwardOriginChat(MessageForwardOriginChat)

    /// The message was originally sent by a user, which is hidden by their privacy settings
    case messageForwardOriginHiddenUser(MessageForwardOriginHiddenUser)

    /// The message was originally a post in a channel
    case messageForwardOriginChannel(MessageForwardOriginChannel)

    /// The message was imported from an exported message history
    case messageForwardOriginMessageImport(MessageForwardOriginMessageImport)


    private enum Kind: String, Codable {
        case messageForwardOriginUser
        case messageForwardOriginChat
        case messageForwardOriginHiddenUser
        case messageForwardOriginChannel
        case messageForwardOriginMessageImport
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .messageForwardOriginUser:
            let value = try MessageForwardOriginUser(from: decoder)
            self = .messageForwardOriginUser(value)
        case .messageForwardOriginChat:
            let value = try MessageForwardOriginChat(from: decoder)
            self = .messageForwardOriginChat(value)
        case .messageForwardOriginHiddenUser:
            let value = try MessageForwardOriginHiddenUser(from: decoder)
            self = .messageForwardOriginHiddenUser(value)
        case .messageForwardOriginChannel:
            let value = try MessageForwardOriginChannel(from: decoder)
            self = .messageForwardOriginChannel(value)
        case .messageForwardOriginMessageImport:
            let value = try MessageForwardOriginMessageImport(from: decoder)
            self = .messageForwardOriginMessageImport(value)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case .messageForwardOriginUser(let value):
            try container.encode(Kind.messageForwardOriginUser, forKey: .type)
            try value.encode(to: encoder)
        case .messageForwardOriginChat(let value):
            try container.encode(Kind.messageForwardOriginChat, forKey: .type)
            try value.encode(to: encoder)
        case .messageForwardOriginHiddenUser(let value):
            try container.encode(Kind.messageForwardOriginHiddenUser, forKey: .type)
            try value.encode(to: encoder)
        case .messageForwardOriginChannel(let value):
            try container.encode(Kind.messageForwardOriginChannel, forKey: .type)
            try value.encode(to: encoder)
        case .messageForwardOriginMessageImport(let value):
            try container.encode(Kind.messageForwardOriginMessageImport, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// The message was originally sent by a known user
public struct MessageForwardOriginUser: Codable {

    /// Identifier of the user that originally sent the message
    public var senderUserId: Int


    public init (senderUserId: Int) {
        self.senderUserId = senderUserId
    }
}

/// The message was originally sent by an anonymous chat administrator on behalf of the chat
public struct MessageForwardOriginChat: Codable {

    /// Original message author signature
    public var authorSignature: String

    /// Identifier of the chat that originally sent the message
    public var senderChatId: Int64


    public init (
        authorSignature: String,
        senderChatId: Int64) {

        self.authorSignature = authorSignature
        self.senderChatId = senderChatId
    }
}

/// The message was originally sent by a user, which is hidden by their privacy settings
public struct MessageForwardOriginHiddenUser: Codable {

    /// Name of the sender
    public var senderName: String


    public init (senderName: String) {
        self.senderName = senderName
    }
}

/// The message was originally a post in a channel
public struct MessageForwardOriginChannel: Codable {

    /// Original post author signature
    public var authorSignature: String

    /// Identifier of the chat from which the message was originally forwarded
    public var chatId: Int64

    /// Message identifier of the original message
    public var messageId: Int64


    public init (
        authorSignature: String,
        chatId: Int64,
        messageId: Int64) {

        self.authorSignature = authorSignature
        self.chatId = chatId
        self.messageId = messageId
    }
}

/// The message was imported from an exported message history
public struct MessageForwardOriginMessageImport: Codable {

    /// Name of the sender
    public var senderName: String


    public init (senderName: String) {
        self.senderName = senderName
    }
}

