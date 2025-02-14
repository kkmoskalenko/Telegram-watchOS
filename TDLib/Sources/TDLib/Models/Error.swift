//
//  Error.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// An object of this type can be returned on every function call, in case of an error
public struct Error: Codable, Swift.Error {

    /// Error code; subject to future changes. If the error code is 406, the error message must not be processed in any way and must not be displayed to the user
    public var code: Int

    /// Error message; subject to future changes
    public var message: String


    public init (
        code: Int,
        message: String) {

        self.code = code
        self.message = message
    }
}

