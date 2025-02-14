//
//  MessageSendingState.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Contains information about the sending state of the message
public enum MessageSendingState: Codable {

    /// The message is being sent now, but has not yet been delivered to the server
    case messageSendingStatePending

    /// The message failed to be sent
    case messageSendingStateFailed(MessageSendingStateFailed)


    private enum Kind: String, Codable {
        case messageSendingStatePending
        case messageSendingStateFailed
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .messageSendingStatePending:
            self = .messageSendingStatePending
        case .messageSendingStateFailed:
            let value = try MessageSendingStateFailed(from: decoder)
            self = .messageSendingStateFailed(value)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case .messageSendingStatePending:
            try container.encode(Kind.messageSendingStatePending, forKey: .type)
        case .messageSendingStateFailed(let value):
            try container.encode(Kind.messageSendingStateFailed, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// The message failed to be sent
public struct MessageSendingStateFailed: Codable {

    /// True, if the message can be re-sent
    public var canRetry: Bool

    /// An error code; 0 if unknown
    public var errorCode: Int

    /// Error message
    public var errorMessage: String

    /// Time left before the message can be re-sent, in seconds. No update is sent when this field changes
    public var retryAfter: Double


    public init (
        canRetry: Bool,
        errorCode: Int,
        errorMessage: String,
        retryAfter: Double) {

        self.canRetry = canRetry
        self.errorCode = errorCode
        self.errorMessage = errorMessage
        self.retryAfter = retryAfter
    }
}

