//
//  EncryptedCredentials.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Contains encrypted Telegram Passport data credentials
public struct EncryptedCredentials: Codable {

    /// The encrypted credentials
    public var data: Data

    /// The decrypted data hash
    public var hash: Data

    /// Secret for data decryption, encrypted with the service's public key
    public var secret: Data


    public init (
        data: Data,
        hash: Data,
        secret: Data) {

        self.data = data
        self.hash = hash
        self.secret = secret
    }
}

