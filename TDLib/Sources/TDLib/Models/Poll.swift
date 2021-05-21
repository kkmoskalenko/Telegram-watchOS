//
//  Poll.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Describes a poll
public struct Poll: Codable {

    /// Point in time (Unix timestamp) when the poll will be automatically closed
    public var closeDate: Int

    /// Unique poll identifier
    public var id: TdInt64

    /// True, if the poll is anonymous
    public var isAnonymous: Bool

    /// True, if the poll is closed
    public var isClosed: Bool

    /// Amount of time the poll will be active after creation, in seconds
    public var openPeriod: Int

    /// List of poll answer options
    public var options: [PollOption]

    /// Poll question; 1-300 characters
    public var question: String

    /// User identifiers of recent voters, if the poll is non-anonymous
    public var recentVoterUserIds: [Int]

    /// Total number of voters, participating in the poll
    public var totalVoterCount: Int

    /// Type of the poll
    public var type: PollType


    public init (
        closeDate: Int,
        id: TdInt64,
        isAnonymous: Bool,
        isClosed: Bool,
        openPeriod: Int,
        options: [PollOption],
        question: String,
        recentVoterUserIds: [Int],
        totalVoterCount: Int,
        type: PollType) {

        self.closeDate = closeDate
        self.id = id
        self.isAnonymous = isAnonymous
        self.isClosed = isClosed
        self.openPeriod = openPeriod
        self.options = options
        self.question = question
        self.recentVoterUserIds = recentVoterUserIds
        self.totalVoterCount = totalVoterCount
        self.type = type
    }
}

