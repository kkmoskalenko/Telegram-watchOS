//
//  ChatActionBar.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Describes actions which should be possible to do through a chat action bar
public enum ChatActionBar: Codable {

    /// The chat can be reported as spam using the method reportChat with the reason chatReportReasonSpam
    case chatActionBarReportSpam(ChatActionBarReportSpam)

    /// The chat is a location-based supergroup, which can be reported as having unrelated location using the method reportChat with the reason chatReportReasonUnrelatedLocation
    case chatActionBarReportUnrelatedLocation

    /// The chat is a recently created group chat, to which new members can be invited
    case chatActionBarInviteMembers

    /// The chat is a private or secret chat, which can be reported using the method reportChat, or the other user can be blocked using the method blockUser, or the other user can be added to the contact list using the method addContact
    case chatActionBarReportAddBlock(ChatActionBarReportAddBlock)

    /// The chat is a private or secret chat and the other user can be added to the contact list using the method addContact
    case chatActionBarAddContact

    /// The chat is a private or secret chat with a mutual contact and the user's phone number can be shared with the other user using the method sharePhoneNumber
    case chatActionBarSharePhoneNumber


    private enum Kind: String, Codable {
        case chatActionBarReportSpam
        case chatActionBarReportUnrelatedLocation
        case chatActionBarInviteMembers
        case chatActionBarReportAddBlock
        case chatActionBarAddContact
        case chatActionBarSharePhoneNumber
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .chatActionBarReportSpam:
            let value = try ChatActionBarReportSpam(from: decoder)
            self = .chatActionBarReportSpam(value)
        case .chatActionBarReportUnrelatedLocation:
            self = .chatActionBarReportUnrelatedLocation
        case .chatActionBarInviteMembers:
            self = .chatActionBarInviteMembers
        case .chatActionBarReportAddBlock:
            let value = try ChatActionBarReportAddBlock(from: decoder)
            self = .chatActionBarReportAddBlock(value)
        case .chatActionBarAddContact:
            self = .chatActionBarAddContact
        case .chatActionBarSharePhoneNumber:
            self = .chatActionBarSharePhoneNumber
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case .chatActionBarReportSpam(let value):
            try container.encode(Kind.chatActionBarReportSpam, forKey: .type)
            try value.encode(to: encoder)
        case .chatActionBarReportUnrelatedLocation:
            try container.encode(Kind.chatActionBarReportUnrelatedLocation, forKey: .type)
        case .chatActionBarInviteMembers:
            try container.encode(Kind.chatActionBarInviteMembers, forKey: .type)
        case .chatActionBarReportAddBlock(let value):
            try container.encode(Kind.chatActionBarReportAddBlock, forKey: .type)
            try value.encode(to: encoder)
        case .chatActionBarAddContact:
            try container.encode(Kind.chatActionBarAddContact, forKey: .type)
        case .chatActionBarSharePhoneNumber:
            try container.encode(Kind.chatActionBarSharePhoneNumber, forKey: .type)
        }
    }
}

/// The chat can be reported as spam using the method reportChat with the reason chatReportReasonSpam
public struct ChatActionBarReportSpam: Codable {

    /// If true, the chat was automatically archived and can be moved back to the main chat list using addChatToList simultaneously with setting chat notification settings to default using setChatNotificationSettings
    public var canUnarchive: Bool


    public init (canUnarchive: Bool) {
        self.canUnarchive = canUnarchive
    }
}

/// The chat is a private or secret chat, which can be reported using the method reportChat, or the other user can be blocked using the method blockUser, or the other user can be added to the contact list using the method addContact
public struct ChatActionBarReportAddBlock: Codable {

    /// If true, the chat was automatically archived and can be moved back to the main chat list using addChatToList simultaneously with setting chat notification settings to default using setChatNotificationSettings
    public var canUnarchive: Bool

    /// If non-negative, the current user was found by the peer through searchChatsNearby and this is the distance between the users
    public var distance: Int


    public init (
        canUnarchive: Bool,
        distance: Int) {

        self.canUnarchive = canUnarchive
        self.distance = distance
    }
}

