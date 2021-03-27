//
//  Sticker.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Describes a sticker
public struct Sticker: Codable {

    /// Emoji corresponding to the sticker
    public var emoji: String

    /// Sticker height; as defined by the sender
    public var height: Int

    /// True, if the sticker is an animated sticker in TGS format
    public var isAnimated: Bool

    /// True, if the sticker is a mask
    public var isMask: Bool

    /// Position where the mask should be placed; may be null
    public var maskPosition: MaskPosition?

    /// Sticker's outline represented as a list of closed vector paths; may be empty. The coordinate system origin is in the upper-left corner
    public var outline: [ClosedVectorPath]

    /// The identifier of the sticker set to which the sticker belongs; 0 if none
    public var setId: TdInt64

    /// File containing the sticker
    public var sticker: File

    /// Sticker thumbnail in WEBP or JPEG format; may be null
    public var thumbnail: Thumbnail?

    /// Sticker width; as defined by the sender
    public var width: Int


    public init (
        emoji: String,
        height: Int,
        isAnimated: Bool,
        isMask: Bool,
        maskPosition: MaskPosition?,
        outline: [ClosedVectorPath],
        setId: TdInt64,
        sticker: File,
        thumbnail: Thumbnail?,
        width: Int) {

        self.emoji = emoji
        self.height = height
        self.isAnimated = isAnimated
        self.isMask = isMask
        self.maskPosition = maskPosition
        self.outline = outline
        self.setId = setId
        self.sticker = sticker
        self.thumbnail = thumbnail
        self.width = width
    }
}

