//
//  KeyboardButtonType.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Describes a keyboard button type
public enum KeyboardButtonType: Codable {

    /// A simple button, with text that should be sent when the button is pressed
    case keyboardButtonTypeText

    /// A button that sends the user's phone number when pressed; available only in private chats
    case keyboardButtonTypeRequestPhoneNumber

    /// A button that sends the user's location when pressed; available only in private chats
    case keyboardButtonTypeRequestLocation

    /// A button that allows the user to create and send a poll when pressed; available only in private chats
    case keyboardButtonTypeRequestPoll(KeyboardButtonTypeRequestPoll)


    private enum Kind: String, Codable {
        case keyboardButtonTypeText
        case keyboardButtonTypeRequestPhoneNumber
        case keyboardButtonTypeRequestLocation
        case keyboardButtonTypeRequestPoll
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .keyboardButtonTypeText:
            self = .keyboardButtonTypeText
        case .keyboardButtonTypeRequestPhoneNumber:
            self = .keyboardButtonTypeRequestPhoneNumber
        case .keyboardButtonTypeRequestLocation:
            self = .keyboardButtonTypeRequestLocation
        case .keyboardButtonTypeRequestPoll:
            let value = try KeyboardButtonTypeRequestPoll(from: decoder)
            self = .keyboardButtonTypeRequestPoll(value)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case .keyboardButtonTypeText:
            try container.encode(Kind.keyboardButtonTypeText, forKey: .type)
        case .keyboardButtonTypeRequestPhoneNumber:
            try container.encode(Kind.keyboardButtonTypeRequestPhoneNumber, forKey: .type)
        case .keyboardButtonTypeRequestLocation:
            try container.encode(Kind.keyboardButtonTypeRequestLocation, forKey: .type)
        case .keyboardButtonTypeRequestPoll(let value):
            try container.encode(Kind.keyboardButtonTypeRequestPoll, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// A button that allows the user to create and send a poll when pressed; available only in private chats
public struct KeyboardButtonTypeRequestPoll: Codable {

    /// If true, only polls in quiz mode must be allowed to create
    public var forceQuiz: Bool

    /// If true, only regular polls must be allowed to create
    public var forceRegular: Bool


    public init (
        forceQuiz: Bool,
        forceRegular: Bool) {

        self.forceQuiz = forceQuiz
        self.forceRegular = forceRegular
    }
}

