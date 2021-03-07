//
//  GroupCallRecentSpeaker.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Describes a recently speaking user in a group call
public struct GroupCallRecentSpeaker: Codable {

    /// True, is the user has spoken recently
    public let isSpeaking: Bool

    /// User identifier
    public let userId: Int


    public init (
        isSpeaking: Bool,
        userId: Int) {

        self.isSpeaking = isSpeaking
        self.userId = userId
    }
}

