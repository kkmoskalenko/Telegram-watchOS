//
//  Minithumbnail.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Thumbnail image of a very poor quality and low resolution
public struct Minithumbnail: Codable {

    /// The thumbnail in JPEG format
    public var data: Data

    /// Thumbnail height, usually doesn't exceed 40
    public var height: Int

    /// Thumbnail width, usually doesn't exceed 40
    public var width: Int


    public init (
        data: Data,
        height: Int,
        width: Int) {

        self.data = data
        self.height = height
        self.width = width
    }
}

