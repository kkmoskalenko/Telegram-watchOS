//
//  AnimatedChatPhoto.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Animated variant of a chat photo in MPEG4 format
public struct AnimatedChatPhoto: Codable {

    /// Information about the animation file
    public var file: File

    /// Animation width and height
    public var length: Int

    /// Timestamp of the frame, used as a static chat photo
    public var mainFrameTimestamp: Double


    public init (
        file: File,
        length: Int,
        mainFrameTimestamp: Double) {

        self.file = file
        self.length = length
        self.mainFrameTimestamp = mainFrameTimestamp
    }
}

