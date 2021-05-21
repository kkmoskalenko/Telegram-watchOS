//
//  Game.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Describes a game
public struct Game: Codable {

    /// Game animation; may be null
    public var animation: Animation?

    public var description: String

    /// Game ID
    public var id: TdInt64

    /// Game photo
    public var photo: Photo

    /// Game short name. To share a game use the URL https://t.me/{bot_username}?game={game_short_name}
    public var shortName: String

    /// Game text, usually containing scoreboards for a game
    public var text: FormattedText

    /// Game title
    public var title: String


    public init (
        animation: Animation?,
        description: String,
        id: TdInt64,
        photo: Photo,
        shortName: String,
        text: FormattedText,
        title: String) {

        self.animation = animation
        self.description = description
        self.id = id
        self.photo = photo
        self.shortName = shortName
        self.text = text
        self.title = title
    }
}

