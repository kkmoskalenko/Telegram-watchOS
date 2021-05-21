//
//  AuthenticationCodeInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Information about the authentication code that was sent
public struct AuthenticationCodeInfo: Codable {

    /// Describes the way the next code will be sent to the user; may be null
    public var nextType: AuthenticationCodeType?

    /// A phone number that is being authenticated
    public var phoneNumber: String

    /// Timeout before the code should be re-sent, in seconds
    public var timeout: Int

    /// Describes the way the code was sent to the user
    public var type: AuthenticationCodeType


    public init (
        nextType: AuthenticationCodeType?,
        phoneNumber: String,
        timeout: Int,
        type: AuthenticationCodeType) {

        self.nextType = nextType
        self.phoneNumber = phoneNumber
        self.timeout = timeout
        self.type = type
    }
}

