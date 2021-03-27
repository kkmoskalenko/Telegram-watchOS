//
//  PhotoSize.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Describes an image in JPEG format
public struct PhotoSize: Codable {

    /// Image height
    public var height: Int

    /// Information about the image file
    public var photo: File

    /// Sizes of progressive JPEG file prefixes, which can be used to preliminarily show the image
    public var progressiveSizes: [Int]

    /// Image type (see https://core.telegram.org/constructor/photoSize)
    public var type: String

    /// Image width
    public var width: Int


    public init (
        height: Int,
        photo: File,
        progressiveSizes: [Int],
        type: String,
        width: Int) {

        self.height = height
        self.photo = photo
        self.progressiveSizes = progressiveSizes
        self.type = type
        self.width = width
    }
}

