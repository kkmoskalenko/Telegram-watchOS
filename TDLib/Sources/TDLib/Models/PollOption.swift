//
//  PollOption.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Describes one answer option of a poll
public struct PollOption: Codable {

    /// True, if the option is being chosen by a pending setPollAnswer request
    public var isBeingChosen: Bool

    /// True, if the option was chosen by the user
    public var isChosen: Bool

    /// Option text; 1-100 characters
    public var text: String

    /// The percentage of votes for this option; 0-100
    public var votePercentage: Int

    /// Number of voters for this option, available only for closed or voted polls
    public var voterCount: Int


    public init (
        isBeingChosen: Bool,
        isChosen: Bool,
        text: String,
        votePercentage: Int,
        voterCount: Int) {

        self.isBeingChosen = isBeingChosen
        self.isChosen = isChosen
        self.text = text
        self.votePercentage = votePercentage
        self.voterCount = voterCount
    }
}

