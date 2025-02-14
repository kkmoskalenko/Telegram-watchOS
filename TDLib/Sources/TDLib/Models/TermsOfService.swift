//
//  TermsOfService.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Contains Telegram terms of service
public struct TermsOfService: Codable {

    /// The minimum age of a user to be able to accept the terms; 0 if any
    public var minUserAge: Int

    /// True, if a blocking popup with terms of service must be shown to the user
    public var showPopup: Bool

    /// Text of the terms of service
    public var text: FormattedText


    public init (
        minUserAge: Int,
        showPopup: Bool,
        text: FormattedText) {

        self.minUserAge = minUserAge
        self.showPopup = showPopup
        self.text = text
    }
}

