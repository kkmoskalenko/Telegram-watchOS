//
//  ContentView.swift
//  Telegram WatchKit Extension
//
//  Created by Konstantin Moskalenko on 06.03.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var model = AuthModel()
    
    var body: some View {
        switch model.state {
            case .loggedOut:
                VStack {
                    Text("You are currently logged out")
                        .font(.headline)
                    Text("Please wait or try restarting the app.")
                        .font(.subheadline)
                }
                .multilineTextAlignment(.center)
            case .waitOtherDeviceConfirmation(let link):
                LogInView(link: link)
            case .waitPassword:
                VStack {
                    Text("Enter Your Password")
                        .font(.headline)
                        .padding(.bottom)
                    TextField("Password", text: $model.password)
                        .textContentType(.password)
                    Button("Sign In", action: model.checkPassword)
                }
            case .loggedIn:
                Text("You are logged in!")
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
