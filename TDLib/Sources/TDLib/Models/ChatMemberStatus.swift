//
//  ChatMemberStatus.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Provides information about the status of a member in a chat
public enum ChatMemberStatus: Codable {

    /// The user is the owner of a chat and has all the administrator privileges
    case chatMemberStatusCreator(ChatMemberStatusCreator)

    /// The user is a member of a chat and has some additional privileges. In basic groups, administrators can edit and delete messages sent by others, add new members, ban unprivileged members, and manage voice chats. In supergroups and channels, there are more detailed options for administrator privileges
    case chatMemberStatusAdministrator(ChatMemberStatusAdministrator)

    /// The user is a member of a chat, without any additional privileges or restrictions
    case chatMemberStatusMember

    /// The user is under certain restrictions in the chat. Not supported in basic groups and channels
    case chatMemberStatusRestricted(ChatMemberStatusRestricted)

    /// The user is not a chat member
    case chatMemberStatusLeft

    /// The user was banned (and hence is not a member of the chat). Implies the user can't return to the chat or view messages
    case chatMemberStatusBanned(ChatMemberStatusBanned)


    private enum Kind: String, Codable {
        case chatMemberStatusCreator
        case chatMemberStatusAdministrator
        case chatMemberStatusMember
        case chatMemberStatusRestricted
        case chatMemberStatusLeft
        case chatMemberStatusBanned
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .chatMemberStatusCreator:
            let value = try ChatMemberStatusCreator(from: decoder)
            self = .chatMemberStatusCreator(value)
        case .chatMemberStatusAdministrator:
            let value = try ChatMemberStatusAdministrator(from: decoder)
            self = .chatMemberStatusAdministrator(value)
        case .chatMemberStatusMember:
            self = .chatMemberStatusMember
        case .chatMemberStatusRestricted:
            let value = try ChatMemberStatusRestricted(from: decoder)
            self = .chatMemberStatusRestricted(value)
        case .chatMemberStatusLeft:
            self = .chatMemberStatusLeft
        case .chatMemberStatusBanned:
            let value = try ChatMemberStatusBanned(from: decoder)
            self = .chatMemberStatusBanned(value)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case .chatMemberStatusCreator(let value):
            try container.encode(Kind.chatMemberStatusCreator, forKey: .type)
            try value.encode(to: encoder)
        case .chatMemberStatusAdministrator(let value):
            try container.encode(Kind.chatMemberStatusAdministrator, forKey: .type)
            try value.encode(to: encoder)
        case .chatMemberStatusMember:
            try container.encode(Kind.chatMemberStatusMember, forKey: .type)
        case .chatMemberStatusRestricted(let value):
            try container.encode(Kind.chatMemberStatusRestricted, forKey: .type)
            try value.encode(to: encoder)
        case .chatMemberStatusLeft:
            try container.encode(Kind.chatMemberStatusLeft, forKey: .type)
        case .chatMemberStatusBanned(let value):
            try container.encode(Kind.chatMemberStatusBanned, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// The user is the owner of a chat and has all the administrator privileges
public struct ChatMemberStatusCreator: Codable {

    /// A custom title of the owner; 0-16 characters without emojis; applicable to supergroups only
    public var customTitle: String

    /// True, if the creator isn't shown in the chat member list and sends messages anonymously; applicable to supergroups only
    public var isAnonymous: Bool

    /// True, if the user is a member of the chat
    public var isMember: Bool


    public init (
        customTitle: String,
        isAnonymous: Bool,
        isMember: Bool) {

        self.customTitle = customTitle
        self.isAnonymous = isAnonymous
        self.isMember = isMember
    }
}

/// The user is a member of a chat and has some additional privileges. In basic groups, administrators can edit and delete messages sent by others, add new members, ban unprivileged members, and manage voice chats. In supergroups and channels, there are more detailed options for administrator privileges
public struct ChatMemberStatusAdministrator: Codable {

    /// True, if the current user can edit the administrator privileges for the called user
    public var canBeEdited: Bool

    /// True, if the administrator can change the chat title, photo, and other settings
    public var canChangeInfo: Bool

    /// True, if the administrator can delete messages of other users
    public var canDeleteMessages: Bool

    /// True, if the administrator can edit messages of other users and pin messages; applicable to channels only
    public var canEditMessages: Bool

    /// True, if the administrator can invite new users to the chat
    public var canInviteUsers: Bool

    /// True, if the administrator can get chat event log, get chat statistics, get message statistics in channels, get channel members, see anonymous administrators in supergroups and ignore slow mode. Implied by any other privilege; applicable to supergroups and channels only
    public var canManageChat: Bool

    /// True, if the administrator can manage voice chats
    public var canManageVoiceChats: Bool

    /// True, if the administrator can pin messages; applicable to basic groups and supergroups only
    public var canPinMessages: Bool

    /// True, if the administrator can create channel posts; applicable to channels only
    public var canPostMessages: Bool

    /// True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that were directly or indirectly promoted by them
    public var canPromoteMembers: Bool

    /// True, if the administrator can restrict, ban, or unban chat members
    public var canRestrictMembers: Bool

    /// A custom title of the administrator; 0-16 characters without emojis; applicable to supergroups only
    public var customTitle: String

    /// True, if the administrator isn't shown in the chat member list and sends messages anonymously; applicable to supergroups only
    public var isAnonymous: Bool


    public init (
        canBeEdited: Bool,
        canChangeInfo: Bool,
        canDeleteMessages: Bool,
        canEditMessages: Bool,
        canInviteUsers: Bool,
        canManageChat: Bool,
        canManageVoiceChats: Bool,
        canPinMessages: Bool,
        canPostMessages: Bool,
        canPromoteMembers: Bool,
        canRestrictMembers: Bool,
        customTitle: String,
        isAnonymous: Bool) {

        self.canBeEdited = canBeEdited
        self.canChangeInfo = canChangeInfo
        self.canDeleteMessages = canDeleteMessages
        self.canEditMessages = canEditMessages
        self.canInviteUsers = canInviteUsers
        self.canManageChat = canManageChat
        self.canManageVoiceChats = canManageVoiceChats
        self.canPinMessages = canPinMessages
        self.canPostMessages = canPostMessages
        self.canPromoteMembers = canPromoteMembers
        self.canRestrictMembers = canRestrictMembers
        self.customTitle = customTitle
        self.isAnonymous = isAnonymous
    }
}

/// The user is under certain restrictions in the chat. Not supported in basic groups and channels
public struct ChatMemberStatusRestricted: Codable {

    /// True, if the user is a member of the chat
    public var isMember: Bool

    /// User permissions in the chat
    public var permissions: ChatPermissions

    /// Point in time (Unix timestamp) when restrictions will be lifted from the user; 0 if never. If the user is restricted for more than 366 days or for less than 30 seconds from the current time, the user is considered to be restricted forever
    public var restrictedUntilDate: Int


    public init (
        isMember: Bool,
        permissions: ChatPermissions,
        restrictedUntilDate: Int) {

        self.isMember = isMember
        self.permissions = permissions
        self.restrictedUntilDate = restrictedUntilDate
    }
}

/// The user was banned (and hence is not a member of the chat). Implies the user can't return to the chat or view messages
public struct ChatMemberStatusBanned: Codable {

    /// Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days or for less than 30 seconds from the current time, the user is considered to be banned forever. Always 0 in basic groups
    public var bannedUntilDate: Int


    public init (bannedUntilDate: Int) {
        self.bannedUntilDate = bannedUntilDate
    }
}

