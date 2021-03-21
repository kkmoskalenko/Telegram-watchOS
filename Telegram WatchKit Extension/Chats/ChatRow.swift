//
//  ChatRow.swift
//  Telegram WatchKit Extension
//
//  Created by Konstantin Moskalenko on 16.03.2021.
//

import SwiftUI
import TDLib

struct ChatRow: View {
    var chat: Chat
    var lastMessageSender: User?
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            chatPhoto
                .frame(width: 24, height: 24)
                .alignmentGuide(.top) { _ in -7 }
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(chatTitle)
                    .font(.headline)
                    .fontWeight(.medium)
                Group {
                    lastMessageText
                    lastMessageTime
                }
                .font(.footnote)
                .foregroundColor(.secondary)
            }
        }
        .lineLimit(1)
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(
            BadgeView(unreadCountString)
                .disabled(chat.notificationSettings.muteFor > 0)
                .alignmentGuide(.trailing) { d in d[.trailing] - 5 },
            alignment: .bottomTrailing)
    }
    
    @ViewBuilder
    private var chatPhoto: some View {
        if let photoPath = chat.photo?.small.local.path,
           let image = UIImage(contentsOfFile: photoPath)
        {
            Image(uiImage: image)
                .resizable()
        } else {
            Color.gray
                .overlay(Text(chatTitle.prefix(1)))
                .font(.system(.headline, design: .rounded))
        }
    }
    
    private var lastMessageText: some View {
        let message = lastMessageString ?? ""
        let showingSenderName: Bool
        
        switch chat.type {
            case .chatTypeBasicGroup, .chatTypeSupergroup:
                showingSenderName = !senderName.isEmpty
                    && !message.isEmpty
            case .chatTypePrivate, .chatTypeSecret:
                showingSenderName = false
        }
        
        let name = showingSenderName ?
            "\(senderName): " : ""
        
        let nameText = Text(name)
            .foregroundColor(.white)
        let messageText = Text(message)
        
        return nameText + messageText
    }
    
    private var lastMessageTime: some View {
        HStack(spacing: 3) {
            Text(timeString ?? "")
            
            if let message = chat.lastMessage, message.isOutgoing,
               message.id != chat.lastReadOutboxMessageId
            {
                Circle()
                    .fill(Color.accentColor)
                    .frame(width: 6, height: 6)
            }
        }
    }
    
    // MARK: - Getting chat properties
    
    private var chatTitle: String {
        chat.title.isEmpty ? "Deleted Account" : chat.title
    }
    
    private var senderName: String {
        guard
            let message = chat.lastMessage,
            let user = lastMessageSender
        else { return "" }
        
        return message.isOutgoing ? "You" :
            user.firstName.prefix(1)
            .appending(user.lastName.prefix(1))
    }
    
    private var lastMessageString: String? {
        chat.lastMessage?.content.description
            .replacingOccurrences(of: "\n", with: " ")
    }
    
    private var timeString: String? {
        guard let timestamp = chat.lastMessage?.date else { return nil }
        let date = Foundation.Date(timeIntervalSince1970: Double(timestamp))
        
        let calendar = Calendar.current
        let formatter = DateFormatter()
        
        if calendar.isDateInToday(date) {
            formatter.dateStyle = .none
            formatter.timeStyle = .short
        } else if calendar.isDateInYesterday(date) {
            return "Yesterday"
        } else if calendar.isDateInThisWeek(date) {
            let weekday = calendar.component(.weekday, from: date)
            return calendar.weekdaySymbols[weekday - 1]
        } else {
            formatter.dateStyle = .short
            formatter.timeStyle = .none
        }
        
        return formatter.string(from: date)
    }
    
    private var unreadCountString: String? {
        if chat.unreadCount > 0 {
            return String(chat.unreadCount)
        }
        
        return chat.isMarkedAsUnread ? "" : nil
    }
}

extension ChatRow: Equatable {
    // One more workaround to prevent the crash on watchOS 6
    // https://noahgilmore.com/blog/swiftui-equatable-crash/
    
    static func == (lhs: ChatRow, rhs: ChatRow) -> Bool { false }
}

fileprivate extension Calendar {
    func isDateInThisWeek(_ date: Foundation.Date) -> Bool {
        isDate(date, equalTo: Date(), toGranularity: .weekOfYear)
    }
}
