//
//  ChatList.swift
//  Telegram WatchKit Extension
//
//  Created by Konstantin Moskalenko on 19.03.2021.
//

import SwiftUI

struct ChatList: View {
    @ObservedObject private var model = ChatListModel()
    
    var body: some View {
        List(model.chats, rowContent: ChatRow.init)
            .navigationBarTitle("Chats")
            .animation(.default)
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList()
    }
}
