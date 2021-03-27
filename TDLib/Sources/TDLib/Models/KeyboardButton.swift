//
//  KeyboardButton.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Represents a single button in a bot keyboard
public struct KeyboardButton: Codable {

    /// Text of the button
    public var text: String

    /// Type of the button
    public var type: KeyboardButtonType


    public init (
        text: String,
        type: KeyboardButtonType) {

        self.text = text
        self.type = type
    }
}

