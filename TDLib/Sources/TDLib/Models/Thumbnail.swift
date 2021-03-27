//
//  Thumbnail.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Represents a thumbnail
public struct Thumbnail: Codable {

    /// The thumbnail
    public var file: File

    /// Thumbnail format
    public var format: ThumbnailFormat

    /// Thumbnail height
    public var height: Int

    /// Thumbnail width
    public var width: Int


    public init (
        file: File,
        format: ThumbnailFormat,
        height: Int,
        width: Int) {

        self.file = file
        self.format = format
        self.height = height
        self.width = width
    }
}

