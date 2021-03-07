//
//  ToggleGroupCallParticipantIsMuted.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Toggles whether a group call participant is muted, unmuted, or allowed to unmute themself
public struct ToggleGroupCallParticipantIsMuted: Codable {

    /// Group call identifier
    public let groupCallId: Int

    /// Pass true if the user must be muted and false otherwise
    public let isMuted: Bool

    /// User identifier
    public let userId: Int


    public init (
        groupCallId: Int,
        isMuted: Bool,
        userId: Int) {

        self.groupCallId = groupCallId
        self.isMuted = isMuted
        self.userId = userId
    }
}

