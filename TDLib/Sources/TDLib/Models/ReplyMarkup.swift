//
//  ReplyMarkup.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Contains a description of a custom keyboard and actions that can be done with it to quickly reply to bots
public enum ReplyMarkup: Codable {

    /// Instructs application to remove the keyboard once this message has been received. This kind of keyboard can't be received in an incoming message; instead, UpdateChatReplyMarkup with message_id == 0 will be sent
    case replyMarkupRemoveKeyboard(ReplyMarkupRemoveKeyboard)

    /// Instructs application to force a reply to this message
    case replyMarkupForceReply(ReplyMarkupForceReply)

    /// Contains a custom keyboard layout to quickly reply to bots
    case replyMarkupShowKeyboard(ReplyMarkupShowKeyboard)

    /// Contains an inline keyboard layout
    case replyMarkupInlineKeyboard(ReplyMarkupInlineKeyboard)


    private enum Kind: String, Codable {
        case replyMarkupRemoveKeyboard
        case replyMarkupForceReply
        case replyMarkupShowKeyboard
        case replyMarkupInlineKeyboard
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .replyMarkupRemoveKeyboard:
            let value = try ReplyMarkupRemoveKeyboard(from: decoder)
            self = .replyMarkupRemoveKeyboard(value)
        case .replyMarkupForceReply:
            let value = try ReplyMarkupForceReply(from: decoder)
            self = .replyMarkupForceReply(value)
        case .replyMarkupShowKeyboard:
            let value = try ReplyMarkupShowKeyboard(from: decoder)
            self = .replyMarkupShowKeyboard(value)
        case .replyMarkupInlineKeyboard:
            let value = try ReplyMarkupInlineKeyboard(from: decoder)
            self = .replyMarkupInlineKeyboard(value)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case .replyMarkupRemoveKeyboard(let value):
            try container.encode(Kind.replyMarkupRemoveKeyboard, forKey: .type)
            try value.encode(to: encoder)
        case .replyMarkupForceReply(let value):
            try container.encode(Kind.replyMarkupForceReply, forKey: .type)
            try value.encode(to: encoder)
        case .replyMarkupShowKeyboard(let value):
            try container.encode(Kind.replyMarkupShowKeyboard, forKey: .type)
            try value.encode(to: encoder)
        case .replyMarkupInlineKeyboard(let value):
            try container.encode(Kind.replyMarkupInlineKeyboard, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// Instructs application to remove the keyboard once this message has been received. This kind of keyboard can't be received in an incoming message; instead, UpdateChatReplyMarkup with message_id == 0 will be sent
public struct ReplyMarkupRemoveKeyboard: Codable {

    /// True, if the keyboard is removed only for the mentioned users or the target user of a reply
    public var isPersonal: Bool


    public init (isPersonal: Bool) {
        self.isPersonal = isPersonal
    }
}

/// Instructs application to force a reply to this message
public struct ReplyMarkupForceReply: Codable {

    /// True, if a forced reply must automatically be shown to the current user. For outgoing messages, specify true to show the forced reply only for the mentioned users and for the target user of a reply
    public var isPersonal: Bool


    public init (isPersonal: Bool) {
        self.isPersonal = isPersonal
    }
}

/// Contains a custom keyboard layout to quickly reply to bots
public struct ReplyMarkupShowKeyboard: Codable {

    /// True, if the keyboard must automatically be shown to the current user. For outgoing messages, specify true to show the keyboard only for the mentioned users and for the target user of a reply
    public var isPersonal: Bool

    /// True, if the application needs to hide the keyboard after use
    public var oneTime: Bool

    /// True, if the application needs to resize the keyboard vertically
    public var resizeKeyboard: Bool

    /// A list of rows of bot keyboard buttons
    public var rows: [[KeyboardButton]]


    public init (
        isPersonal: Bool,
        oneTime: Bool,
        resizeKeyboard: Bool,
        rows: [[KeyboardButton]]) {

        self.isPersonal = isPersonal
        self.oneTime = oneTime
        self.resizeKeyboard = resizeKeyboard
        self.rows = rows
    }
}

/// Contains an inline keyboard layout
public struct ReplyMarkupInlineKeyboard: Codable {

    /// A list of rows of inline keyboard buttons
    public var rows: [[InlineKeyboardButton]]


    public init (rows: [[InlineKeyboardButton]]) {
        self.rows = rows
    }
}

