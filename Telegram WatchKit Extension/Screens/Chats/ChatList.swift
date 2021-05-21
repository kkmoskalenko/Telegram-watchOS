//
//  ChatList.swift
//  Telegram WatchKit Extension
//
//  Created by Konstantin Moskalenko on 19.03.2021.
//

import SwiftUI
import TDLib

struct ChatList: View {
    @ObservedObject private var model = ChatListModel()
    
    var body: some View {
        List(model.chats, rowContent: chatRow)
            .navigationBarTitle("Chats")
            .animation(.default)
    }
    
    private func chatRow(for chat: Chat) -> some View {
        if case .messageSenderUser(let sender) = chat.lastMessage?.sender,
           let user = model.users[sender.userId]
        { return ChatRow(chat: chat, lastMessageSender: user) }
        
        return ChatRow(chat: chat)
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList()
    }
}
