//
//  TextEntity.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Represents a part of the text that needs to be formatted in some unusual way
public struct TextEntity: Codable {

    /// Length of the entity, in UTF-16 code units
    public var length: Int

    /// Offset of the entity, in UTF-16 code units
    public var offset: Int

    /// Type of the entity
    public var type: TextEntityType


    public init (
        length: Int,
        offset: Int,
        type: TextEntityType) {

        self.length = length
        self.offset = offset
        self.type = type
    }
}

