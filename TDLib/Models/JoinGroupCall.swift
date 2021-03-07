//
//  JoinGroupCall.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Joins a group call
public struct JoinGroupCall: Codable {

    /// Group call identifier
    public let groupCallId: Int

    /// True, if the user's microphone is muted
    public let isMuted: Bool

    /// Group join payload, received from tgcalls. Use null to cancel previous joinGroupCall request
    public let payload: GroupCallPayload

    /// Caller synchronization source identifier; received from tgcalls
    public let source: Int


    public init (
        groupCallId: Int,
        isMuted: Bool,
        payload: GroupCallPayload,
        source: Int) {

        self.groupCallId = groupCallId
        self.isMuted = isMuted
        self.payload = payload
        self.source = source
    }
}

