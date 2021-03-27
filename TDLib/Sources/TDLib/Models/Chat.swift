//
//  Chat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// A chat. (Can be a private chat, basic group, supergroup, or secret chat)
public struct Chat: Codable, Identifiable {

    /// Describes actions which should be possible to do through a chat action bar; may be null
    public var actionBar: ChatActionBar?

    /// True, if the chat messages can be deleted for all users
    public var canBeDeletedForAllUsers: Bool

    /// True, if the chat messages can be deleted only for the current user while other users will continue to see the messages
    public var canBeDeletedOnlyForSelf: Bool

    /// True, if the chat can be reported to Telegram moderators through reportChat or reportChatPhoto
    public var canBeReported: Bool

    /// Contains application-specific data associated with the chat. (For example, the chat scroll position or local chat notification settings can be stored here.) Persistent if the message database is used
    public var clientData: String

    /// Default value of the disable_notification parameter, used when a message is sent to the chat
    public var defaultDisableNotification: Bool

    /// A draft of a message in the chat; may be null
    public var draftMessage: DraftMessage?

    /// True, if the chat has scheduled messages
    public var hasScheduledMessages: Bool

    /// Chat unique identifier
    public var id: Int64

    /// True, if the chat is blocked by the current user and private messages from the chat can't be received
    public var isBlocked: Bool

    /// True, if the chat is marked as unread
    public var isMarkedAsUnread: Bool

    /// Last message in the chat; may be null
    public var lastMessage: Message?

    /// Identifier of the last read incoming message
    public var lastReadInboxMessageId: Int64

    /// Identifier of the last read outgoing message
    public var lastReadOutboxMessageId: Int64

    /// Current message Time To Live setting (self-destruct timer) for the chat; 0 if not defined. TTL is counted from the time message or its content is viewed in secret chats and from the send date in other chats
    public var messageTtlSetting: Int

    /// Notification settings for this chat
    public var notificationSettings: ChatNotificationSettings

    /// Actions that non-administrator chat members are allowed to take in the chat
    public var permissions: ChatPermissions

    /// Chat photo; may be null
    public var photo: ChatPhotoInfo?

    /// Positions of the chat in chat lists
    public var positions: [ChatPosition]

    /// Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat
    public var replyMarkupMessageId: Int64

    /// Chat title
    public var title: String

    /// Type of the chat
    public var type: ChatType

    /// Number of unread messages in the chat
    public var unreadCount: Int

    /// Number of unread messages with a mention/reply in the chat
    public var unreadMentionCount: Int

    /// Contains information about voice chat of the chat
    public var voiceChat: VoiceChat


    public init (
        actionBar: ChatActionBar?,
        canBeDeletedForAllUsers: Bool,
        canBeDeletedOnlyForSelf: Bool,
        canBeReported: Bool,
        clientData: String,
        defaultDisableNotification: Bool,
        draftMessage: DraftMessage?,
        hasScheduledMessages: Bool,
        id: Int64,
        isBlocked: Bool,
        isMarkedAsUnread: Bool,
        lastMessage: Message?,
        lastReadInboxMessageId: Int64,
        lastReadOutboxMessageId: Int64,
        messageTtlSetting: Int,
        notificationSettings: ChatNotificationSettings,
        permissions: ChatPermissions,
        photo: ChatPhotoInfo?,
        positions: [ChatPosition],
        replyMarkupMessageId: Int64,
        title: String,
        type: ChatType,
        unreadCount: Int,
        unreadMentionCount: Int,
        voiceChat: VoiceChat) {

        self.actionBar = actionBar
        self.canBeDeletedForAllUsers = canBeDeletedForAllUsers
        self.canBeDeletedOnlyForSelf = canBeDeletedOnlyForSelf
        self.canBeReported = canBeReported
        self.clientData = clientData
        self.defaultDisableNotification = defaultDisableNotification
        self.draftMessage = draftMessage
        self.hasScheduledMessages = hasScheduledMessages
        self.id = id
        self.isBlocked = isBlocked
        self.isMarkedAsUnread = isMarkedAsUnread
        self.lastMessage = lastMessage
        self.lastReadInboxMessageId = lastReadInboxMessageId
        self.lastReadOutboxMessageId = lastReadOutboxMessageId
        self.messageTtlSetting = messageTtlSetting
        self.notificationSettings = notificationSettings
        self.permissions = permissions
        self.photo = photo
        self.positions = positions
        self.replyMarkupMessageId = replyMarkupMessageId
        self.title = title
        self.type = type
        self.unreadCount = unreadCount
        self.unreadMentionCount = unreadMentionCount
        self.voiceChat = voiceChat
    }
}

