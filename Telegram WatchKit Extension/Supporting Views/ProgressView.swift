//
//  ProgressView.swift
//  Telegram WatchKit Extension
//
//  Created by Konstantin Moskalenko on 23.05.2021.
//

import SwiftUI

struct ProgressView<Content: View>: View {
    var content: Content
    
    var body: some View {
        if #available(watchOSApplicationExtension 7.0, *) {
            SwiftUI.ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        } else {
            content
        }
    }
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView { Text("Please wait") }
    }
}
