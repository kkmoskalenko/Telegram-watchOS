//
//  DownloadFile.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Downloads a file from the cloud. Download progress and completion of the download will be notified through updateFile updates
public struct DownloadFile: Codable {

    /// Identifier of the file to download
    public var fileId: Int

    /// Number of bytes which should be downloaded starting from the "offset" position before the download will be automatically cancelled; use 0 to download without a limit
    public var limit: Int

    /// The starting position from which the file should be downloaded
    public var offset: Int

    /// Priority of the download (1-32). The higher the priority, the earlier the file will be downloaded. If the priorities of two files are equal, then the last one for which downloadFile was called will be downloaded first
    public var priority: Int

    /// If false, this request returns file state just after the download has been started. If true, this request returns file state only after//-the download has succeeded, has failed, has been cancelled or a new downloadFile request with different offset/limit parameters was sent
    public var synchronous: Bool


    public init (
        fileId: Int,
        limit: Int,
        offset: Int,
        priority: Int,
        synchronous: Bool) {

        self.fileId = fileId
        self.limit = limit
        self.offset = offset
        self.priority = priority
        self.synchronous = synchronous
    }
}

