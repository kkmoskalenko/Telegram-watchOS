//
//  ChatPermissions.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Describes actions that a user is allowed to take in a chat
public struct ChatPermissions: Codable {

    /// True, if the user may add a web page preview to their messages. Implies can_send_messages permissions
    public var canAddWebPagePreviews: Bool

    /// True, if the user can change the chat title, photo, and other settings
    public var canChangeInfo: Bool

    /// True, if the user can invite new users to the chat
    public var canInviteUsers: Bool

    /// True, if the user can pin messages
    public var canPinMessages: Bool

    /// True, if the user can send audio files, documents, photos, videos, video notes, and voice notes. Implies can_send_messages permissions
    public var canSendMediaMessages: Bool

    /// True, if the user can send text messages, contacts, locations, and venues
    public var canSendMessages: Bool

    /// True, if the user can send animations, games, stickers, and dice and use inline bots. Implies can_send_messages permissions
    public var canSendOtherMessages: Bool

    /// True, if the user can send polls. Implies can_send_messages permissions
    public var canSendPolls: Bool


    public init (
        canAddWebPagePreviews: Bool,
        canChangeInfo: Bool,
        canInviteUsers: Bool,
        canPinMessages: Bool,
        canSendMediaMessages: Bool,
        canSendMessages: Bool,
        canSendOtherMessages: Bool,
        canSendPolls: Bool) {

        self.canAddWebPagePreviews = canAddWebPagePreviews
        self.canChangeInfo = canChangeInfo
        self.canInviteUsers = canInviteUsers
        self.canPinMessages = canPinMessages
        self.canSendMediaMessages = canSendMediaMessages
        self.canSendMessages = canSendMessages
        self.canSendOtherMessages = canSendOtherMessages
        self.canSendPolls = canSendPolls
    }
}

