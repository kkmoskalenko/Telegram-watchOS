//
//  InputThumbnail.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// A thumbnail to be sent along with a file; must be in JPEG or WEBP format for stickers, and less than 200 KB in size
public struct InputThumbnail: Codable {

    /// Thumbnail height, usually shouldn't exceed 320. Use 0 if unknown
    public var height: Int

    /// Thumbnail file to send. Sending thumbnails by file_id is currently not supported
    public var thumbnail: InputFile

    /// Thumbnail width, usually shouldn't exceed 320. Use 0 if unknown
    public var width: Int


    public init (
        height: Int,
        thumbnail: InputFile,
        width: Int) {

        self.height = height
        self.thumbnail = thumbnail
        self.width = width
    }
}

