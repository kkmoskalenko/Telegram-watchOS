//
//  PollType.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Describes the type of a poll
public enum PollType: Codable {

    /// A regular poll
    case pollTypeRegular(PollTypeRegular)

    /// A poll in quiz mode, which has exactly one correct answer option and can be answered only once
    case pollTypeQuiz(PollTypeQuiz)


    private enum Kind: String, Codable {
        case pollTypeRegular
        case pollTypeQuiz
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .pollTypeRegular:
            let value = try PollTypeRegular(from: decoder)
            self = .pollTypeRegular(value)
        case .pollTypeQuiz:
            let value = try PollTypeQuiz(from: decoder)
            self = .pollTypeQuiz(value)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case .pollTypeRegular(let value):
            try container.encode(Kind.pollTypeRegular, forKey: .type)
            try value.encode(to: encoder)
        case .pollTypeQuiz(let value):
            try container.encode(Kind.pollTypeQuiz, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// A regular poll
public struct PollTypeRegular: Codable {

    /// True, if multiple answer options can be chosen simultaneously
    public var allowMultipleAnswers: Bool


    public init (allowMultipleAnswers: Bool) {
        self.allowMultipleAnswers = allowMultipleAnswers
    }
}

/// A poll in quiz mode, which has exactly one correct answer option and can be answered only once
public struct PollTypeQuiz: Codable {

    /// 0-based identifier of the correct answer option; -1 for a yet unanswered poll
    public var correctOptionId: Int

    /// Text that is shown when the user chooses an incorrect answer or taps on the lamp icon; 0-200 characters with at most 2 line feeds; empty for a yet unanswered poll
    public var explanation: FormattedText


    public init (
        correctOptionId: Int,
        explanation: FormattedText) {

        self.correctOptionId = correctOptionId
        self.explanation = explanation
    }
}

