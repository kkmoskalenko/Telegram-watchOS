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
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            chatPhoto
                .frame(width: 24, height: 24)
                .alignmentGuide(.top) { _ in -7 }
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(chat.title)
                    .font(.headline)
                    .fontWeight(.medium)
                Group {
                    Text(lastMessageString ?? "")
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
                .overlay(Text(chat.title.prefix(1)))
                .font(.system(.headline, design: .rounded))
        }
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
    
    private var lastMessageString: String? {
        chat.lastMessage?.content.description
    }
    
    private var timeString: String? {
        guard let timestamp = chat.lastMessage?.date else { return nil }
        let date = Foundation.Date(timeIntervalSince1970: Double(timestamp))
        let components = Calendar.current.dateComponents(
            [.hour, .minute], from: date)
        
        guard let hour = components.hour,
              let minute = components.minute
        else { return nil }
        
        return String(format: "%d:%02d", hour, minute)
    }
    
    private var unreadCountString: String? {
        if chat.unreadCount > 0 {
            return String(chat.unreadCount)
        }
        
        return chat.isMarkedAsUnread ? "" : nil
    }
}
