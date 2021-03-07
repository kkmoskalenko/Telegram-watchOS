//
//  SetGroupCallParticipantVolumeLevel.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Changes a group call participant's volume level. If the current user can manage the group call, then the participant's volume level will be changed for all users with default volume level
public struct SetGroupCallParticipantVolumeLevel: Codable {

    /// Group call identifier
    public let groupCallId: Int

    /// User identifier
    public let userId: Int

    /// New participant's volume level; 1-20000 in hundreds of percents
    public let volumeLevel: Int


    public init (
        groupCallId: Int,
        userId: Int,
        volumeLevel: Int) {

        self.groupCallId = groupCallId
        self.userId = userId
        self.volumeLevel = volumeLevel
    }
}

