//
//  RootView.swift
//  Telegram WatchKit Extension
//
//  Created by Konstantin Moskalenko on 06.03.2021.
//

import SwiftUI

struct RootView: View {
    @ObservedObject private var model = AuthModel()
    
    var body: some View {
        switch model.state {
            case .loggedOut:
                ProgressView {
                    VStack {
                        Text("You are logged out")
                            .font(.headline)
                        Text("Please wait or try restarting the app.")
                            .font(.subheadline)
                    }
                    .multilineTextAlignment(.center)
                }
            case .waitOtherDeviceConfirmation(let link):
                LogInView(link: link)
            case .waitPassword:
                VStack {
                    Text("Enter Your Password")
                        .font(.headline)
                        .padding(.bottom)
                    SecureField("Password", text: $model.password)
                        .textContentType(.password)
                    Button("Sign In", action: model.checkPassword)
                }
            case .loggedIn:
                ChatList()
                    .accentColor(.blue)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
