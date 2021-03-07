//
//  GetExternalLink.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Returns an HTTP URL to open when user clicks on a given HTTP link. This method can be used to automatically login user on a Telegram site
public struct GetExternalLink: Codable {

    /// The HTTP link
    public let link: String


    public init (link: String) {
        self.link = link
    }
}

