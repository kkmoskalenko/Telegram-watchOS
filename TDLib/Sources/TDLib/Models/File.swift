//
//  File.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Represents a file
public struct File: Codable {

    /// Expected file size in case the exact file size is unknown, but an approximate size is known. Can be used to show download/upload progress
    public var expectedSize: Int

    /// Unique file identifier
    public var id: Int

    /// Information about the local copy of the file
    public var local: LocalFile

    /// Information about the remote copy of the file
    public var remote: RemoteFile

    /// File size; 0 if unknown
    public var size: Int


    public init (
        expectedSize: Int,
        id: Int,
        local: LocalFile,
        remote: RemoteFile,
        size: Int) {

        self.expectedSize = expectedSize
        self.id = id
        self.local = local
        self.remote = remote
        self.size = size
    }
}

