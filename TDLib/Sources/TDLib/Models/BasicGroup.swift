//
//  BasicGroup.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Represents a basic group of 0-200 users (must be upgraded to a supergroup to accommodate more than 200 users)
public struct BasicGroup: Codable {

    /// Group identifier
    public var id: Int

    /// True, if the group is active
    public var isActive: Bool

    /// Number of members in the group
    public var memberCount: Int

    /// Status of the current user in the group
    public var status: ChatMemberStatus

    /// Identifier of the supergroup to which this group was upgraded; 0 if none
    public var upgradedToSupergroupId: Int


    public init (
        id: Int,
        isActive: Bool,
        memberCount: Int,
        status: ChatMemberStatus,
        upgradedToSupergroupId: Int) {

        self.id = id
        self.isActive = isActive
        self.memberCount = memberCount
        self.status = status
        self.upgradedToSupergroupId = upgradedToSupergroupId
    }
}

