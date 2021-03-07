//
//  GroupCallJoinResponse.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Describes a join response for interaction with tgcalls
public struct GroupCallJoinResponse: Codable {

    /// Join response candidates to pass to tgcalls
    public let candidates: [GroupCallJoinResponseCandidate]

    /// Join response payload to pass to tgcalls
    public let payload: GroupCallPayload


    public init (
        candidates: [GroupCallJoinResponseCandidate],
        payload: GroupCallPayload) {

        self.candidates = candidates
        self.payload = payload
    }
}

