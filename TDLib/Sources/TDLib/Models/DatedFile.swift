//
//  DatedFile.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// File with the date it was uploaded
public struct DatedFile: Codable {

    /// Point in time (Unix timestamp) when the file was uploaded
    public var date: Int

    /// The file
    public var file: File


    public init (
        date: Int,
        file: File) {

        self.date = date
        self.file = file
    }
}

