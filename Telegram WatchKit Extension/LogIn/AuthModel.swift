//
//  AuthModel.swift
//  Telegram WatchKit Extension
//
//  Created by Konstantin Moskalenko on 09.03.2021.
//

import Foundation
import WatchKit.WKInterfaceDevice
import TDLib

class AuthModel: ObservableObject {
    @Published var password = ""
    @Published private(set) var state = AuthState.loggedOut
    private var authorizationState: AuthorizationState?
    
    init() {
        TelegramService.shared.addListener(self)
    }
    
    deinit {
        TelegramService.shared.removeListener(self)
    }
    
    enum AuthState {
        case loggedIn, loggedOut, waitPassword
        case waitOtherDeviceConfirmation(String)
    }
    
    func checkPassword() {
        guard case .authorizationStateWaitPassword(_) = authorizationState,
              !password.isEmpty else { return }
        
        try? TelegramService.shared.api.checkAuthenticationPassword(
            password: password, completion: { result in
                if case .failure(_) = result {
                    self.password = ""
                }
            })
    }
}

// MARK: - UpdateListener

extension AuthModel: UpdateListener {
    func onUpdate(_ update: Update) {
        if case .updateAuthorizationState(let value) = update {
            onAuthorizationStateUpdated(value.authorizationState)
        }
    }
    
    private func onAuthorizationStateUpdated(_ state: AuthorizationState?) {
        if let state = state { authorizationState = state }
        
        let handler = { (result: Result<Ok, Swift.Error>) in
            if case .failure(_) = result {
                // Repeating last action
                self.onAuthorizationStateUpdated(nil)
            }
        }
        
        let api = TelegramService.shared.api
        switch authorizationState {
            case .authorizationStateWaitTdlibParameters:
                try? api.setTdlibParameters(
                    parameters: parameters,
                    completion: handler)
            case .authorizationStateWaitEncryptionKey(_):
                try? api.setDatabaseEncryptionKey(
                    newEncryptionKey: Data(),
                    completion: handler)
            case .authorizationStateWaitPhoneNumber,
                 .authorizationStateWaitCode(_),
                 .authorizationStateWaitRegistration(_):
                try? api.requestQrCodeAuthentication(
                    otherUserIds: [],
                    completion: handler)
            case .authorizationStateWaitOtherDeviceConfirmation(let value):
                self.state = .waitOtherDeviceConfirmation(value.link)
            case .authorizationStateWaitPassword(_):
                self.state = .waitPassword
            case .authorizationStateReady:
                self.state = .loggedIn
            case .authorizationStateLoggingOut:
                self.state = .loggedOut
            case .authorizationStateClosing:
                self.state = .loggedOut
            case .authorizationStateClosed:
                // TODO: Recreate TDLib client
                break
            case nil: break
        }
    }
    
    private var parameters: TdlibParameters {
        guard let apiHash = Bundle.main.apiHash else {
            fatalError("API_HASH is not specified, check Config.xcconfig")
        }
        
        guard let apiId = Bundle.main.apiId else {
            fatalError("API_ID is not specified, check Config.xcconfig")
        }
        
        guard let appVersion = Bundle.main.appVersion else {
            fatalError("Failed to get app version")
        }
        
        guard let cachesUrl = FileManager.default.urls(
            for: .cachesDirectory, in: .userDomainMask
        ).first else { fatalError("Failed to get the caches directory") }
        
        let tdlibPath = cachesUrl.appendingPathComponent(
            "tdlib", isDirectory: true).path
        
        let device = WKInterfaceDevice.current()
        let deviceModel = device.model
        let systemVersion = device.systemVersion
        
        let languageCode = Locale.current.languageCode ?? "en"
        
        return TdlibParameters(
            apiHash: apiHash, apiId: apiId, applicationVersion: appVersion,
            databaseDirectory: tdlibPath, deviceModel: deviceModel,
            enableStorageOptimizer: true, filesDirectory: "",
            ignoreFileNames: true, systemLanguageCode: languageCode,
            systemVersion: systemVersion, useChatInfoDatabase: true,
            useFileDatabase: true, useMessageDatabase: true,
            useSecretChats: false, useTestDc: false
        )
    }
}
