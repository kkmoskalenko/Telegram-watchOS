//
//  DiceStickers.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Contains animated stickers which should be used for dice animation rendering
public enum DiceStickers: Codable {

    /// A regular animated sticker
    case diceStickersRegular(DiceStickersRegular)

    /// Animated stickers to be combined into a slot machine
    case diceStickersSlotMachine(DiceStickersSlotMachine)


    private enum Kind: String, Codable {
        case diceStickersRegular
        case diceStickersSlotMachine
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .diceStickersRegular:
            let value = try DiceStickersRegular(from: decoder)
            self = .diceStickersRegular(value)
        case .diceStickersSlotMachine:
            let value = try DiceStickersSlotMachine(from: decoder)
            self = .diceStickersSlotMachine(value)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case .diceStickersRegular(let value):
            try container.encode(Kind.diceStickersRegular, forKey: .type)
            try value.encode(to: encoder)
        case .diceStickersSlotMachine(let value):
            try container.encode(Kind.diceStickersSlotMachine, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// A regular animated sticker
public struct DiceStickersRegular: Codable {

    /// The animated sticker with the dice animation
    public var sticker: Sticker


    public init (sticker: Sticker) {
        self.sticker = sticker
    }
}

/// Animated stickers to be combined into a slot machine
public struct DiceStickersSlotMachine: Codable {

    /// The animated sticker with the slot machine background. The background animation must start playing after all reel animations finish
    public var background: Sticker

    /// The animated sticker with the center reel
    public var centerReel: Sticker

    /// The animated sticker with the left reel
    public var leftReel: Sticker

    /// The animated sticker with the lever animation. The lever animation must play once in the initial dice state
    public var lever: Sticker

    /// The animated sticker with the right reel
    public var rightReel: Sticker


    public init (
        background: Sticker,
        centerReel: Sticker,
        leftReel: Sticker,
        lever: Sticker,
        rightReel: Sticker) {

        self.background = background
        self.centerReel = centerReel
        self.leftReel = leftReel
        self.lever = lever
        self.rightReel = rightReel
    }
}

