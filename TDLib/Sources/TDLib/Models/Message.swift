//
//  Message.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Describes a message
public struct Message: Codable {

    /// For channel posts and anonymous group messages, optional author signature
    public var authorSignature: String

    /// True, if the message can be deleted for all users
    public var canBeDeletedForAllUsers: Bool

    /// True, if the message can be deleted only for the current user while other users will continue to see it
    public var canBeDeletedOnlyForSelf: Bool

    /// True, if the message can be edited. For live location and poll messages this fields shows whether editMessageLiveLocation or stopPoll can be used with this message by the application
    public var canBeEdited: Bool

    /// True, if the message can be forwarded
    public var canBeForwarded: Bool

    /// True, if the message thread info is available
    public var canGetMessageThread: Bool

    /// True, if the message statistics are available
    public var canGetStatistics: Bool

    /// Chat identifier
    public var chatId: Int64

    /// True, if the message contains an unread mention for the current user
    public var containsUnreadMention: Bool

    /// Content of the message
    public var content: MessageContent

    /// Point in time (Unix timestamp) when the message was sent
    public var date: Int

    /// Point in time (Unix timestamp) when the message was last edited
    public var editDate: Int

    /// Information about the initial message sender; may be null
    public var forwardInfo: MessageForwardInfo?

    /// Message identifier; unique for the chat to which the message belongs
    public var id: Int64

    /// Information about interactions with the message; may be null
    public var interactionInfo: MessageInteractionInfo?

    /// True, if the message is a channel post. All messages to channels are channel posts, all other messages are not channel posts
    public var isChannelPost: Bool

    /// True, if the message is outgoing
    public var isOutgoing: Bool

    /// True, if the message is pinned
    public var isPinned: Bool

    /// Unique identifier of an album this message belongs to. Only audios, documents, photos and videos can be grouped together in albums
    public var mediaAlbumId: TdInt64

    /// If non-zero, the identifier of the message thread the message belongs to; unique within the chat to which the message belongs
    public var messageThreadId: Int64

    /// If non-zero, the identifier of the chat to which the replied message belongs; Currently, only messages in the Replies chat can have different reply_in_chat_id and chat_id
    public var replyInChatId: Int64

    /// Reply markup for the message; may be null
    public var replyMarkup: ReplyMarkup?

    /// If non-zero, the identifier of the message this message is replying to; can be the identifier of a deleted message
    public var replyToMessageId: Int64

    /// If non-empty, contains a human-readable description of the reason why access to this message must be restricted
    public var restrictionReason: String

    /// Information about the scheduling state of the message; may be null
    public var schedulingState: MessageSchedulingState?

    /// The sender of the message
    public var sender: MessageSender

    /// Information about the sending state of the message; may be null
    public var sendingState: MessageSendingState?

    /// For self-destructing messages, the message's TTL (Time To Live), in seconds; 0 if none. TDLib will send updateDeleteMessages or updateMessageContent once the TTL expires
    public var ttl: Int

    /// Time left before the message expires, in seconds
    public var ttlExpiresIn: Double

    /// If non-zero, the user identifier of the bot through which this message was sent
    public var viaBotUserId: Int


    public init (
        authorSignature: String,
        canBeDeletedForAllUsers: Bool,
        canBeDeletedOnlyForSelf: Bool,
        canBeEdited: Bool,
        canBeForwarded: Bool,
        canGetMessageThread: Bool,
        canGetStatistics: Bool,
        chatId: Int64,
        containsUnreadMention: Bool,
        content: MessageContent,
        date: Int,
        editDate: Int,
        forwardInfo: MessageForwardInfo?,
        id: Int64,
        interactionInfo: MessageInteractionInfo?,
        isChannelPost: Bool,
        isOutgoing: Bool,
        isPinned: Bool,
        mediaAlbumId: TdInt64,
        messageThreadId: Int64,
        replyInChatId: Int64,
        replyMarkup: ReplyMarkup?,
        replyToMessageId: Int64,
        restrictionReason: String,
        schedulingState: MessageSchedulingState?,
        sender: MessageSender,
        sendingState: MessageSendingState?,
        ttl: Int,
        ttlExpiresIn: Double,
        viaBotUserId: Int) {

        self.authorSignature = authorSignature
        self.canBeDeletedForAllUsers = canBeDeletedForAllUsers
        self.canBeDeletedOnlyForSelf = canBeDeletedOnlyForSelf
        self.canBeEdited = canBeEdited
        self.canBeForwarded = canBeForwarded
        self.canGetMessageThread = canGetMessageThread
        self.canGetStatistics = canGetStatistics
        self.chatId = chatId
        self.containsUnreadMention = containsUnreadMention
        self.content = content
        self.date = date
        self.editDate = editDate
        self.forwardInfo = forwardInfo
        self.id = id
        self.interactionInfo = interactionInfo
        self.isChannelPost = isChannelPost
        self.isOutgoing = isOutgoing
        self.isPinned = isPinned
        self.mediaAlbumId = mediaAlbumId
        self.messageThreadId = messageThreadId
        self.replyInChatId = replyInChatId
        self.replyMarkup = replyMarkup
        self.replyToMessageId = replyToMessageId
        self.restrictionReason = restrictionReason
        self.schedulingState = schedulingState
        self.sender = sender
        self.sendingState = sendingState
        self.ttl = ttl
        self.ttlExpiresIn = ttlExpiresIn
        self.viaBotUserId = viaBotUserId
    }
}

