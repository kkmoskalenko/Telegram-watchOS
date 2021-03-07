//
//  LoadGroupCallParticipants.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Loads more group call participants. The loaded participants will be received through updates. Use the field groupCall.loaded_all_participants to check whether all participants has already been loaded
public struct LoadGroupCallParticipants: Codable {

    /// Group call identifier. The group call must be previously received through getGroupCall and must be joined or being joined
    public let groupCallId: Int

    /// Maximum number of participants to load
    public let limit: Int


    public init (
        groupCallId: Int,
        limit: Int) {

        self.groupCallId = groupCallId
        self.limit = limit
    }
}

