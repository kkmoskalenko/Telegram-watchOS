//
//  ChatListModel.swift
//  Telegram WatchKit Extension
//
//  Created by Konstantin Moskalenko on 19.03.2021.
//

import Foundation
import TDLib

class ChatListModel: ObservableObject {
    var chats: [Chat] {
        mainChatList.compactMap {
            chatsDict[$0.chatId]
        }
    }
    
    init() {
        TelegramService.shared.addListener(self)
        getMainChatList()
    }
    
    deinit {
        TelegramService.shared.removeListener(self)
    }
    
    // MARK: - Private Properties
    
    private var haveFullMainChatList = false
    
    private var users = [Int: User]()
    private var basicGroups = [Int: BasicGroup]()
    private var supergroups = [Int: Supergroup]()
    
    private var chatsDict = [Chat.ID: Chat]()
    private var mainChatList = [OrderedChat]()
    
    // MARK: - Private methods
    
    private func getMainChatList(limit: Int = 20) {
        guard !haveFullMainChatList && limit > mainChatList.count else { return }
        
        // send GetChats request if there are some unknown
        // chats and have not enough known chats
        var offsetOrder = TdInt64.max
        var offsetChatId: Chat.ID = 0
        
        if let last = mainChatList.last {
            offsetOrder = last.position.order
            offsetChatId = last.chatId
        }
        
        try? TelegramService.shared.api.getChats(
            chatList: .chatListMain, limit: limit - mainChatList.count,
            offsetChatId: offsetChatId, offsetOrder: offsetOrder
        ) { result in
            guard let chats = try? result.get() else { return }
            
            if chats.chatIds.isEmpty {
                self.haveFullMainChatList = true
            }
            
            // chats had already been received through
            // updates, let's retry request
            self.getMainChatList(limit: limit)
        }
    }
    
    private func setChatPositions(_ chat: Chat, _ positions: [ChatPosition]) {
        for position in positions {
            guard
                case .chatListMain = position.list,
                let index = mainChatList.firstIndex(
                    where: { $0.chatId == chat.id }
                ) else { continue }
            
            mainChatList.remove(at: index)
        }
        
        chatsDict[chat.id] = {
            var copy = chat
            copy.positions = positions
            return copy
        }()
        
        for position in positions {
            if case .chatListMain = position.list {
                mainChatList.append(OrderedChat(
                    chatId: chat.id, position: position
                ))
            }
        }
        
        mainChatList.sort()
    }
    
    private func setChatPositions(chatId: Chat.ID, _ positions: [ChatPosition]) {
        if let chat = chatsDict[chatId] { setChatPositions(chat, positions) }
    }
    
    private func downloadChatPhoto(chatId: Chat.ID) {
        guard let chat = chatsDict[chatId],
              let photo = chat.photo?.small,
              photo.local.canBeDownloaded,
              !photo.local.isDownloadingActive,
              !photo.local.isDownloadingCompleted
        else { return }
        
        try? TelegramService.shared.api.downloadFile(
            fileId: photo.id, limit: 0, offset: 0,
            priority: 1, synchronous: true
        ) { result in
            if let file = try? result.get() {
                self.chatsDict[chatId]?.photo?.small = file
                self.objectWillChange.send()
            }
        }
    }
}

// MARK: - UpdateListener

extension ChatListModel: UpdateListener {
    func onUpdate(_ update: Update) {
        objectWillChange.send()
        
        switch update {
            case .updateUser(let value):
                users[value.user.id] = value.user
            case .updateBasicGroup(let value):
                basicGroups[value.basicGroup.id] = value.basicGroup
            case .updateSupergroup(let value):
                supergroups[value.supergroup.id] = value.supergroup
            case .updateNewChat(let value):
                chatsDict[value.chat.id] = value.chat
                setChatPositions(value.chat, value.chat.positions)
                downloadChatPhoto(chatId: value.chat.id)
            case .updateChatTitle(let value):
                chatsDict[value.chatId]?.title = value.title
            case .updateChatPhoto(let value):
                chatsDict[value.chatId]?.photo = value.photo
                downloadChatPhoto(chatId: value.chatId)
            case .updateChatLastMessage(let value):
                chatsDict[value.chatId]?.lastMessage = value.lastMessage
                setChatPositions(chatId: value.chatId, value.positions)
            case .updateChatPosition(let value):
                setChatPositions(chatId: value.chatId, [value.position])
            case .updateChatReadInbox(let value):
                chatsDict[value.chatId]?.lastReadInboxMessageId = value.lastReadInboxMessageId
                chatsDict[value.chatId]?.unreadCount = value.unreadCount
            case .updateChatReadOutbox(let value):
                chatsDict[value.chatId]?.lastReadOutboxMessageId = value.lastReadOutboxMessageId
            case .updateChatUnreadMentionCount(let value):
                chatsDict[value.chatId]?.unreadMentionCount = value.unreadMentionCount
            case .updateMessageMentionRead(let value):
                chatsDict[value.chatId]?.unreadMentionCount = value.unreadMentionCount
            case .updateChatReplyMarkup(let value):
                chatsDict[value.chatId]?.replyMarkupMessageId = value.replyMarkupMessageId
            case .updateChatDraftMessage(let value):
                chatsDict[value.chatId]?.draftMessage = value.draftMessage
                setChatPositions(chatId: value.chatId, value.positions)
            case .updateChatPermissions(let value):
                chatsDict[value.chatId]?.permissions = value.permissions
            case .updateChatNotificationSettings(let value):
                chatsDict[value.chatId]?.notificationSettings = value.notificationSettings
            case .updateChatDefaultDisableNotification(let value):
                chatsDict[value.chatId]?.defaultDisableNotification = value.defaultDisableNotification
            case .updateChatIsMarkedAsUnread(let value):
                chatsDict[value.chatId]?.isMarkedAsUnread = value.isMarkedAsUnread
            case .updateChatIsBlocked(let value):
                chatsDict[value.chatId]?.isBlocked = value.isBlocked
            case .updateChatHasScheduledMessages(let value):
                chatsDict[value.chatId]?.hasScheduledMessages = value.hasScheduledMessages
            case .updateChatVoiceChat(let value):
                chatsDict[value.chatId]?.isVoiceChatEmpty = value.isVoiceChatEmpty
                chatsDict[value.chatId]?.voiceChatGroupCallId = value.voiceChatGroupCallId
            case .updateChatMessageTtlSetting(let value):
                chatsDict[value.chatId]?.messageTtlSetting = value.messageTtlSetting
            case .updateChatActionBar(let value):
                chatsDict[value.chatId]?.actionBar = value.actionBar
            default: break
        }
    }
}

// MARK: - OrderedChat

extension ChatListModel {
    private struct OrderedChat: Comparable {
        let chatId: Chat.ID
        let position: ChatPosition
        
        static func < (lhs: OrderedChat, rhs: OrderedChat) -> Bool {
            rhs.position.order < lhs.position.order
        }
        
        static func == (lhs: OrderedChat, rhs: OrderedChat) -> Bool {
            lhs.chatId == rhs.chatId && lhs.position.order == rhs.position.order
        }
    }
}
