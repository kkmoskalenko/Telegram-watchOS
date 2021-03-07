//
//  GroupCall.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Describes a group call
public struct GroupCall: Codable {

    /// True, if the current user can manage the group call
    public let canBeManaged: Bool

    /// True, if the current user can enable or disable mute_new_participants setting
    public let canChangeMuteNewParticipants: Bool

    /// True, if the current user can unmute themself
    public let canUnmuteSelf: Bool

    /// Call duration; for ended calls only
    public let duration: Int

    /// Group call identifier
    public let id: Int

    /// True, if the call is active
    public let isActive: Bool

    /// True, if the call is joined
    public let isJoined: Bool

    /// True, if all group call participants are loaded
    public let loadedAllParticipants: Bool

    /// True, if only group call administrators can unmute new participants
    public let muteNewParticipants: Bool

    /// True, if user was kicked from the call because of network loss and the call needs to be rejoined
    public let needRejoin: Bool

    /// Number of participants in the group call
    public let participantCount: Int

    /// Recently speaking users in the group call
    public let recentSpeakers: [GroupCallRecentSpeaker]


    public init (
        canBeManaged: Bool,
        canChangeMuteNewParticipants: Bool,
        canUnmuteSelf: Bool,
        duration: Int,
        id: Int,
        isActive: Bool,
        isJoined: Bool,
        loadedAllParticipants: Bool,
        muteNewParticipants: Bool,
        needRejoin: Bool,
        participantCount: Int,
        recentSpeakers: [GroupCallRecentSpeaker]) {

        self.canBeManaged = canBeManaged
        self.canChangeMuteNewParticipants = canChangeMuteNewParticipants
        self.canUnmuteSelf = canUnmuteSelf
        self.duration = duration
        self.id = id
        self.isActive = isActive
        self.isJoined = isJoined
        self.loadedAllParticipants = loadedAllParticipants
        self.muteNewParticipants = muteNewParticipants
        self.needRejoin = needRejoin
        self.participantCount = participantCount
        self.recentSpeakers = recentSpeakers
    }
}

