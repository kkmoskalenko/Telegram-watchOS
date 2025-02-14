//
//  VideoNote.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Describes a video note. The video must be equal in width and height, cropped to a circle, and stored in MPEG4 format
public struct VideoNote: Codable {

    /// Duration of the video, in seconds; as defined by the sender
    public var duration: Int

    /// Video width and height; as defined by the sender
    public var length: Int

    /// Video minithumbnail; may be null
    public var minithumbnail: Minithumbnail?

    /// Video thumbnail in JPEG format; as defined by the sender; may be null
    public var thumbnail: Thumbnail?

    /// File containing the video
    public var video: File


    public init (
        duration: Int,
        length: Int,
        minithumbnail: Minithumbnail?,
        thumbnail: Thumbnail?,
        video: File) {

        self.duration = duration
        self.length = length
        self.minithumbnail = minithumbnail
        self.thumbnail = thumbnail
        self.video = video
    }
}

