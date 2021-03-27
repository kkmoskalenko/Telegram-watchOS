//
//  EncryptedPassportElement.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Contains information about an encrypted Telegram Passport element; for bots only
public struct EncryptedPassportElement: Codable {

    /// Encrypted JSON-encoded data about the user
    public var data: Data

    /// List of attached files
    public var files: [DatedFile]

    /// The front side of an identity document
    public var frontSide: DatedFile

    /// Hash of the entire element
    public var hash: String

    /// The reverse side of an identity document; may be null
    public var reverseSide: DatedFile?

    /// Selfie with the document; may be null
    public var selfie: DatedFile?

    /// List of files containing a certified English translation of the document
    public var translation: [DatedFile]

    /// Type of Telegram Passport element
    public var type: PassportElementType

    /// Unencrypted data, phone number or email address
    public var value: String


    public init (
        data: Data,
        files: [DatedFile],
        frontSide: DatedFile,
        hash: String,
        reverseSide: DatedFile?,
        selfie: DatedFile?,
        translation: [DatedFile],
        type: PassportElementType,
        value: String) {

        self.data = data
        self.files = files
        self.frontSide = frontSide
        self.hash = hash
        self.reverseSide = reverseSide
        self.selfie = selfie
        self.translation = translation
        self.type = type
        self.value = value
    }
}

