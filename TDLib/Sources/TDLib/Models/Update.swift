//
//  Update.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains notifications about data changes
public enum Update: Codable {
    /// The user authorization state has changed
    case updateAuthorizationState(UpdateAuthorizationState)
    
    /// A new chat has been loaded/created. This update is guaranteed to come before the chat identifier is returned to the application. The chat field changes will be reported through separate updates
    case updateNewChat(UpdateNewChat)
    
    /// The title of a chat was changed
    case updateChatTitle(UpdateChatTitle)
    
    /// A chat photo was changed
    case updateChatPhoto(UpdateChatPhoto)
    
    /// The last message of a chat was changed. If last_message is null, then the last message in the chat became unknown. Some new unknown messages might be added to the chat in this case
    case updateChatLastMessage(UpdateChatLastMessage)
    
    /// The position of a chat in a chat list has changed. Instead of this update updateChatLastMessage or updateChatDraftMessage might be sent
    case updateChatPosition(UpdateChatPosition)
    
    /// A chat was marked as unread or was read
    case updateChatIsMarkedAsUnread(UpdateChatIsMarkedAsUnread)
    
    /// Incoming messages were read or number of unread messages has been changed
    case updateChatReadInbox(UpdateChatReadInbox)
    
    /// Outgoing messages were read
    case updateChatReadOutbox(UpdateChatReadOutbox)
    
    /// Notification settings for a chat were changed
    case updateChatNotificationSettings(UpdateChatNotificationSettings)
    
    /// Some data of a user has changed. This update is guaranteed to come before the user identifier is returned to the application
    case updateUser(UpdateUser)
    
    /// Some data of a basic group has changed. This update is guaranteed to come before the basic group identifier is returned to the application
    case updateBasicGroup(UpdateBasicGroup)
    
    /// Some data of a supergroup or a channel has changed. This update is guaranteed to come before the supergroup identifier is returned to the application
    case updateSupergroup(UpdateSupergroup)
    
    private enum Kind: String, Codable {
        case updateAuthorizationState
        case updateNewChat
        case updateChatTitle
        case updateChatPhoto
        case updateChatLastMessage
        case updateChatPosition
        case updateChatIsMarkedAsUnread
        case updateChatReadInbox
        case updateChatReadOutbox
        case updateChatNotificationSettings
        case updateUser
        case updateBasicGroup
        case updateSupergroup
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
            case .updateAuthorizationState:
                let value = try UpdateAuthorizationState(from: decoder)
                self = .updateAuthorizationState(value)
            case .updateNewChat:
                let value = try UpdateNewChat(from: decoder)
                self = .updateNewChat(value)
            case .updateChatTitle:
                let value = try UpdateChatTitle(from: decoder)
                self = .updateChatTitle(value)
            case .updateChatPhoto:
                let value = try UpdateChatPhoto(from: decoder)
                self = .updateChatPhoto(value)
            case .updateChatLastMessage:
                let value = try UpdateChatLastMessage(from: decoder)
                self = .updateChatLastMessage(value)
            case .updateChatPosition:
                let value = try UpdateChatPosition(from: decoder)
                self = .updateChatPosition(value)
            case .updateChatIsMarkedAsUnread:
                let value = try UpdateChatIsMarkedAsUnread(from: decoder)
                self = .updateChatIsMarkedAsUnread(value)
            case .updateChatReadInbox:
                let value = try UpdateChatReadInbox(from: decoder)
                self = .updateChatReadInbox(value)
            case .updateChatReadOutbox:
                let value = try UpdateChatReadOutbox(from: decoder)
                self = .updateChatReadOutbox(value)
            case .updateChatNotificationSettings:
                let value = try UpdateChatNotificationSettings(from: decoder)
                self = .updateChatNotificationSettings(value)
            case .updateUser:
                let value = try UpdateUser(from: decoder)
                self = .updateUser(value)
            case .updateBasicGroup:
                let value = try UpdateBasicGroup(from: decoder)
                self = .updateBasicGroup(value)
            case .updateSupergroup:
                let value = try UpdateSupergroup(from: decoder)
                self = .updateSupergroup(value)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
            case .updateAuthorizationState(let value):
                try container.encode(Kind.updateAuthorizationState, forKey: .type)
                try value.encode(to: encoder)
            case .updateNewChat(let value):
                try container.encode(Kind.updateNewChat, forKey: .type)
                try value.encode(to: encoder)
            case .updateChatTitle(let value):
                try container.encode(Kind.updateChatTitle, forKey: .type)
                try value.encode(to: encoder)
            case .updateChatPhoto(let value):
                try container.encode(Kind.updateChatPhoto, forKey: .type)
                try value.encode(to: encoder)
            case .updateChatLastMessage(let value):
                try container.encode(Kind.updateChatLastMessage, forKey: .type)
                try value.encode(to: encoder)
            case .updateChatPosition(let value):
                try container.encode(Kind.updateChatPosition, forKey: .type)
                try value.encode(to: encoder)
            case .updateChatIsMarkedAsUnread(let value):
                try container.encode(Kind.updateChatIsMarkedAsUnread, forKey: .type)
                try value.encode(to: encoder)
            case .updateChatReadInbox(let value):
                try container.encode(Kind.updateChatReadInbox, forKey: .type)
                try value.encode(to: encoder)
            case .updateChatReadOutbox(let value):
                try container.encode(Kind.updateChatReadOutbox, forKey: .type)
                try value.encode(to: encoder)
            case .updateChatNotificationSettings(let value):
                try container.encode(Kind.updateChatNotificationSettings, forKey: .type)
                try value.encode(to: encoder)
            case .updateUser(let value):
                try container.encode(Kind.updateUser, forKey: .type)
                try value.encode(to: encoder)
            case .updateBasicGroup(let value):
                try container.encode(Kind.updateBasicGroup, forKey: .type)
                try value.encode(to: encoder)
            case .updateSupergroup(let value):
                try container.encode(Kind.updateSupergroup, forKey: .type)
                try value.encode(to: encoder)
        }
    }
}

/// The user authorization state has changed
public struct UpdateAuthorizationState: Codable {
    /// New authorization state
    public var authorizationState: AuthorizationState
    
    public init (authorizationState: AuthorizationState) {
        self.authorizationState = authorizationState
    }
}

/// A new chat has been loaded/created. This update is guaranteed to come before the chat identifier is returned to the application. The chat field changes will be reported through separate updates
public struct UpdateNewChat: Codable {
    /// The chat
    public var chat: Chat
    
    public init (chat: Chat) {
        self.chat = chat
    }
}

/// The title of a chat was changed
public struct UpdateChatTitle: Codable {
    /// Chat identifier
    public var chatId: Int64
    
    /// The new chat title
    public var title: String
    
    public init (
        chatId: Int64,
        title: String) {
        
        self.chatId = chatId
        self.title = title
    }
}

/// A chat photo was changed
public struct UpdateChatPhoto: Codable {
    /// Chat identifier
    public var chatId: Int64
    
    /// The new chat photo; may be null
    public var photo: ChatPhotoInfo?
    
    public init (
        chatId: Int64,
        photo: ChatPhotoInfo?) {
        
        self.chatId = chatId
        self.photo = photo
    }
}

/// The last message of a chat was changed. If last_message is null, then the last message in the chat became unknown. Some new unknown messages might be added to the chat in this case
public struct UpdateChatLastMessage: Codable {
    /// Chat identifier
    public var chatId: Int64
    
    /// The new last message in the chat; may be null
    public var lastMessage: Message?
    
    /// The new chat positions in the chat lists
    public var positions: [ChatPosition]
    
    public init (
        chatId: Int64,
        lastMessage: Message?,
        positions: [ChatPosition]) {
        
        self.chatId = chatId
        self.lastMessage = lastMessage
        self.positions = positions
    }
}

/// The position of a chat in a chat list has changed. Instead of this update updateChatLastMessage or updateChatDraftMessage might be sent
public struct UpdateChatPosition: Codable {
    /// Chat identifier
    public var chatId: Int64
    
    /// New chat position. If new order is 0, then the chat needs to be removed from the list
    public var position: ChatPosition
    
    public init (
        chatId: Int64,
        position: ChatPosition) {
        
        self.chatId = chatId
        self.position = position
    }
}

/// A chat was marked as unread or was read
public struct UpdateChatIsMarkedAsUnread: Codable {
    /// Chat identifier
    public var chatId: Int64
    
    /// New value of is_marked_as_unread
    public var isMarkedAsUnread: Bool
    
    public init (
        chatId: Int64,
        isMarkedAsUnread: Bool) {
        
        self.chatId = chatId
        self.isMarkedAsUnread = isMarkedAsUnread
    }
}

/// Incoming messages were read or number of unread messages has been changed
public struct UpdateChatReadInbox: Codable {
    /// Chat identifier
    public var chatId: Int64
    
    /// Identifier of the last read incoming message
    public var lastReadInboxMessageId: Int64
    
    /// The number of unread messages left in the chat
    public var unreadCount: Int
    
    public init (
        chatId: Int64,
        lastReadInboxMessageId: Int64,
        unreadCount: Int) {
        
        self.chatId = chatId
        self.lastReadInboxMessageId = lastReadInboxMessageId
        self.unreadCount = unreadCount
    }
}

/// Outgoing messages were read
public struct UpdateChatReadOutbox: Codable {
    /// Chat identifier
    public var chatId: Int64
    
    /// Identifier of last read outgoing message
    public var lastReadOutboxMessageId: Int64
    
    public init (
        chatId: Int64,
        lastReadOutboxMessageId: Int64) {
        
        self.chatId = chatId
        self.lastReadOutboxMessageId = lastReadOutboxMessageId
    }
}

/// Notification settings for a chat were changed
public struct UpdateChatNotificationSettings: Codable {
    /// Chat identifier
    public var chatId: Int64
    
    /// The new notification settings
    public var notificationSettings: ChatNotificationSettings
    
    public init (
        chatId: Int64,
        notificationSettings: ChatNotificationSettings) {
        
        self.chatId = chatId
        self.notificationSettings = notificationSettings
    }
}

/// Some data of a user has changed. This update is guaranteed to come before the user identifier is returned to the application
public struct UpdateUser: Codable {
    /// New data about the user
    public var user: User
    
    public init (user: User) {
        self.user = user
    }
}

/// Some data of a basic group has changed. This update is guaranteed to come before the basic group identifier is returned to the application
public struct UpdateBasicGroup: Codable {
    /// New data about the group
    public var basicGroup: BasicGroup
    
    public init (basicGroup: BasicGroup) {
        self.basicGroup = basicGroup
    }
}

/// Some data of a supergroup or a channel has changed. This update is guaranteed to come before the supergroup identifier is returned to the application
public struct UpdateSupergroup: Codable {
    /// New data about the supergroup
    public var supergroup: Supergroup
    
    public init (supergroup: Supergroup) {
        self.supergroup = supergroup
    }
}
