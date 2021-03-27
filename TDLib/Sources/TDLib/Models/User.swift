//
//  User.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Represents a user
public struct User: Codable {

    /// First name of the user
    public var firstName: String

    /// If false, the user is inaccessible, and the only information known about the user is inside this class. It can't be passed to any method except GetUser
    public var haveAccess: Bool

    /// User identifier
    public var id: Int

    /// The user is a contact of the current user
    public var isContact: Bool

    /// True, if many users reported this user as a fake account
    public var isFake: Bool

    /// The user is a contact of the current user and the current user is a contact of the user
    public var isMutualContact: Bool

    /// True, if many users reported this user as a scam
    public var isScam: Bool

    /// True, if the user is Telegram support account
    public var isSupport: Bool

    /// True, if the user is verified
    public var isVerified: Bool

    /// IETF language tag of the user's language; only available to bots
    public var languageCode: String

    /// Last name of the user
    public var lastName: String

    /// Phone number of the user
    public var phoneNumber: String

    /// Profile photo of the user; may be null
    public var profilePhoto: ProfilePhoto?

    /// If non-empty, it contains a human-readable description of the reason why access to this user must be restricted
    public var restrictionReason: String

    /// Current online status of the user
    public var status: UserStatus

    /// Type of the user
    public var type: UserType

    /// Username of the user
    public var username: String


    public init (
        firstName: String,
        haveAccess: Bool,
        id: Int,
        isContact: Bool,
        isFake: Bool,
        isMutualContact: Bool,
        isScam: Bool,
        isSupport: Bool,
        isVerified: Bool,
        languageCode: String,
        lastName: String,
        phoneNumber: String,
        profilePhoto: ProfilePhoto?,
        restrictionReason: String,
        status: UserStatus,
        type: UserType,
        username: String) {

        self.firstName = firstName
        self.haveAccess = haveAccess
        self.id = id
        self.isContact = isContact
        self.isFake = isFake
        self.isMutualContact = isMutualContact
        self.isScam = isScam
        self.isSupport = isSupport
        self.isVerified = isVerified
        self.languageCode = languageCode
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.profilePhoto = profilePhoto
        self.restrictionReason = restrictionReason
        self.status = status
        self.type = type
        self.username = username
    }
}

