//
//  ProfilePhoto.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Describes a user profile photo
public struct ProfilePhoto: Codable {

    /// A big (640x640) user profile photo. The file can be downloaded only before the photo is changed
    public var big: File

    /// True, if the photo has animated variant
    public var hasAnimation: Bool

    /// Photo identifier; 0 for an empty photo. Can be used to find a photo in a list of user profile photos
    public var id: TdInt64

    /// A small (160x160) user profile photo. The file can be downloaded only before the photo is changed
    public var small: File


    public init (
        big: File,
        hasAnimation: Bool,
        id: TdInt64,
        small: File) {

        self.big = big
        self.hasAnimation = hasAnimation
        self.id = id
        self.small = small
    }
}

