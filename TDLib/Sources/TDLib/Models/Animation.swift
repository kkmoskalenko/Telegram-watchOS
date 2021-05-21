//
//  Animation.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Describes an animation file. The animation must be encoded in GIF or MPEG4 format
public struct Animation: Codable {

    /// File containing the animation
    public var animation: File

    /// Duration of the animation, in seconds; as defined by the sender
    public var duration: Int

    /// Original name of the file; as defined by the sender
    public var fileName: String

    /// True, if stickers were added to the animation. The list of corresponding sticker set can be received using getAttachedStickerSets
    public var hasStickers: Bool

    /// Height of the animation
    public var height: Int

    /// MIME type of the file, usually "image/gif" or "video/mp4"
    public var mimeType: String

    /// Animation minithumbnail; may be null
    public var minithumbnail: Minithumbnail?

    /// Animation thumbnail in JPEG or MPEG4 format; may be null
    public var thumbnail: Thumbnail?

    /// Width of the animation
    public var width: Int


    public init (
        animation: File,
        duration: Int,
        fileName: String,
        hasStickers: Bool,
        height: Int,
        mimeType: String,
        minithumbnail: Minithumbnail?,
        thumbnail: Thumbnail?,
        width: Int) {

        self.animation = animation
        self.duration = duration
        self.fileName = fileName
        self.hasStickers = hasStickers
        self.height = height
        self.mimeType = mimeType
        self.minithumbnail = minithumbnail
        self.thumbnail = thumbnail
        self.width = width
    }
}

