//
//  InputMessageContent.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// The content of a message to send
public enum InputMessageContent: Codable {

    /// A text message
    case inputMessageText(InputMessageText)

    /// An animation message (GIF-style).
    case inputMessageAnimation(InputMessageAnimation)

    /// An audio message
    case inputMessageAudio(InputMessageAudio)

    /// A document message (general file)
    case inputMessageDocument(InputMessageDocument)

    /// A photo message
    case inputMessagePhoto(InputMessagePhoto)

    /// A sticker message
    case inputMessageSticker(InputMessageSticker)

    /// A video message
    case inputMessageVideo(InputMessageVideo)

    /// A video note message
    case inputMessageVideoNote(InputMessageVideoNote)

    /// A voice note message
    case inputMessageVoiceNote(InputMessageVoiceNote)

    /// A message with a location
    case inputMessageLocation(InputMessageLocation)

    /// A message with information about a venue
    case inputMessageVenue(InputMessageVenue)

    /// A message containing a user contact
    case inputMessageContact(InputMessageContact)

    /// A dice message
    case inputMessageDice(InputMessageDice)

    /// A message with a game; not supported for channels or secret chats
    case inputMessageGame(InputMessageGame)

    /// A message with an invoice; can be used only by bots and only in private chats
    case inputMessageInvoice(InputMessageInvoice)

    /// A message with a poll. Polls can't be sent to secret chats. Polls can be sent only to a private chat with a bot
    case inputMessagePoll(InputMessagePoll)

    /// A forwarded message
    case inputMessageForwarded(InputMessageForwarded)


    private enum Kind: String, Codable {
        case inputMessageText
        case inputMessageAnimation
        case inputMessageAudio
        case inputMessageDocument
        case inputMessagePhoto
        case inputMessageSticker
        case inputMessageVideo
        case inputMessageVideoNote
        case inputMessageVoiceNote
        case inputMessageLocation
        case inputMessageVenue
        case inputMessageContact
        case inputMessageDice
        case inputMessageGame
        case inputMessageInvoice
        case inputMessagePoll
        case inputMessageForwarded
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .inputMessageText:
            let value = try InputMessageText(from: decoder)
            self = .inputMessageText(value)
        case .inputMessageAnimation:
            let value = try InputMessageAnimation(from: decoder)
            self = .inputMessageAnimation(value)
        case .inputMessageAudio:
            let value = try InputMessageAudio(from: decoder)
            self = .inputMessageAudio(value)
        case .inputMessageDocument:
            let value = try InputMessageDocument(from: decoder)
            self = .inputMessageDocument(value)
        case .inputMessagePhoto:
            let value = try InputMessagePhoto(from: decoder)
            self = .inputMessagePhoto(value)
        case .inputMessageSticker:
            let value = try InputMessageSticker(from: decoder)
            self = .inputMessageSticker(value)
        case .inputMessageVideo:
            let value = try InputMessageVideo(from: decoder)
            self = .inputMessageVideo(value)
        case .inputMessageVideoNote:
            let value = try InputMessageVideoNote(from: decoder)
            self = .inputMessageVideoNote(value)
        case .inputMessageVoiceNote:
            let value = try InputMessageVoiceNote(from: decoder)
            self = .inputMessageVoiceNote(value)
        case .inputMessageLocation:
            let value = try InputMessageLocation(from: decoder)
            self = .inputMessageLocation(value)
        case .inputMessageVenue:
            let value = try InputMessageVenue(from: decoder)
            self = .inputMessageVenue(value)
        case .inputMessageContact:
            let value = try InputMessageContact(from: decoder)
            self = .inputMessageContact(value)
        case .inputMessageDice:
            let value = try InputMessageDice(from: decoder)
            self = .inputMessageDice(value)
        case .inputMessageGame:
            let value = try InputMessageGame(from: decoder)
            self = .inputMessageGame(value)
        case .inputMessageInvoice:
            let value = try InputMessageInvoice(from: decoder)
            self = .inputMessageInvoice(value)
        case .inputMessagePoll:
            let value = try InputMessagePoll(from: decoder)
            self = .inputMessagePoll(value)
        case .inputMessageForwarded:
            let value = try InputMessageForwarded(from: decoder)
            self = .inputMessageForwarded(value)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case .inputMessageText(let value):
            try container.encode(Kind.inputMessageText, forKey: .type)
            try value.encode(to: encoder)
        case .inputMessageAnimation(let value):
            try container.encode(Kind.inputMessageAnimation, forKey: .type)
            try value.encode(to: encoder)
        case .inputMessageAudio(let value):
            try container.encode(Kind.inputMessageAudio, forKey: .type)
            try value.encode(to: encoder)
        case .inputMessageDocument(let value):
            try container.encode(Kind.inputMessageDocument, forKey: .type)
            try value.encode(to: encoder)
        case .inputMessagePhoto(let value):
            try container.encode(Kind.inputMessagePhoto, forKey: .type)
            try value.encode(to: encoder)
        case .inputMessageSticker(let value):
            try container.encode(Kind.inputMessageSticker, forKey: .type)
            try value.encode(to: encoder)
        case .inputMessageVideo(let value):
            try container.encode(Kind.inputMessageVideo, forKey: .type)
            try value.encode(to: encoder)
        case .inputMessageVideoNote(let value):
            try container.encode(Kind.inputMessageVideoNote, forKey: .type)
            try value.encode(to: encoder)
        case .inputMessageVoiceNote(let value):
            try container.encode(Kind.inputMessageVoiceNote, forKey: .type)
            try value.encode(to: encoder)
        case .inputMessageLocation(let value):
            try container.encode(Kind.inputMessageLocation, forKey: .type)
            try value.encode(to: encoder)
        case .inputMessageVenue(let value):
            try container.encode(Kind.inputMessageVenue, forKey: .type)
            try value.encode(to: encoder)
        case .inputMessageContact(let value):
            try container.encode(Kind.inputMessageContact, forKey: .type)
            try value.encode(to: encoder)
        case .inputMessageDice(let value):
            try container.encode(Kind.inputMessageDice, forKey: .type)
            try value.encode(to: encoder)
        case .inputMessageGame(let value):
            try container.encode(Kind.inputMessageGame, forKey: .type)
            try value.encode(to: encoder)
        case .inputMessageInvoice(let value):
            try container.encode(Kind.inputMessageInvoice, forKey: .type)
            try value.encode(to: encoder)
        case .inputMessagePoll(let value):
            try container.encode(Kind.inputMessagePoll, forKey: .type)
            try value.encode(to: encoder)
        case .inputMessageForwarded(let value):
            try container.encode(Kind.inputMessageForwarded, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// A text message
public struct InputMessageText: Codable {

    /// True, if a chat message draft should be deleted
    public var clearDraft: Bool

    /// True, if rich web page previews for URLs in the message text should be disabled
    public var disableWebPagePreview: Bool

    /// Formatted text to be sent; 1-GetOption("message_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Code, Pre, PreCode, TextUrl and MentionName entities are allowed to be specified manually
    public var text: FormattedText


    public init (
        clearDraft: Bool,
        disableWebPagePreview: Bool,
        text: FormattedText) {

        self.clearDraft = clearDraft
        self.disableWebPagePreview = disableWebPagePreview
        self.text = text
    }
}

/// An animation message (GIF-style).
public struct InputMessageAnimation: Codable {

    /// File identifiers of the stickers added to the animation, if applicable
    public var addedStickerFileIds: [Int]

    /// Animation file to be sent
    public var animation: InputFile

    /// Animation caption; 0-GetOption("message_caption_length_max") characters
    public var caption: FormattedText

    /// Duration of the animation, in seconds
    public var duration: Int

    /// Height of the animation; may be replaced by the server
    public var height: Int

    /// Animation thumbnail, if available
    public var thumbnail: InputThumbnail

    /// Width of the animation; may be replaced by the server
    public var width: Int


    public init (
        addedStickerFileIds: [Int],
        animation: InputFile,
        caption: FormattedText,
        duration: Int,
        height: Int,
        thumbnail: InputThumbnail,
        width: Int) {

        self.addedStickerFileIds = addedStickerFileIds
        self.animation = animation
        self.caption = caption
        self.duration = duration
        self.height = height
        self.thumbnail = thumbnail
        self.width = width
    }
}

/// An audio message
public struct InputMessageAudio: Codable {

    /// Thumbnail of the cover for the album, if available
    public var albumCoverThumbnail: InputThumbnail

    /// Audio file to be sent
    public var audio: InputFile

    /// Audio caption; 0-GetOption("message_caption_length_max") characters
    public var caption: FormattedText

    /// Duration of the audio, in seconds; may be replaced by the server
    public var duration: Int

    /// Performer of the audio; 0-64 characters, may be replaced by the server
    public var performer: String

    /// Title of the audio; 0-64 characters; may be replaced by the server
    public var title: String


    public init (
        albumCoverThumbnail: InputThumbnail,
        audio: InputFile,
        caption: FormattedText,
        duration: Int,
        performer: String,
        title: String) {

        self.albumCoverThumbnail = albumCoverThumbnail
        self.audio = audio
        self.caption = caption
        self.duration = duration
        self.performer = performer
        self.title = title
    }
}

/// A document message (general file)
public struct InputMessageDocument: Codable {

    /// Document caption; 0-GetOption("message_caption_length_max") characters
    public var caption: FormattedText

    /// If true, automatic file type detection will be disabled and the document will be always sent as file. Always true for files sent to secret chats
    public var disableContentTypeDetection: Bool

    /// Document to be sent
    public var document: InputFile

    /// Document thumbnail, if available
    public var thumbnail: InputThumbnail


    public init (
        caption: FormattedText,
        disableContentTypeDetection: Bool,
        document: InputFile,
        thumbnail: InputThumbnail) {

        self.caption = caption
        self.disableContentTypeDetection = disableContentTypeDetection
        self.document = document
        self.thumbnail = thumbnail
    }
}

/// A photo message
public struct InputMessagePhoto: Codable {

    /// File identifiers of the stickers added to the photo, if applicable
    public var addedStickerFileIds: [Int]

    /// Photo caption; 0-GetOption("message_caption_length_max") characters
    public var caption: FormattedText

    /// Photo height
    public var height: Int

    /// Photo to send
    public var photo: InputFile

    /// Photo thumbnail to be sent, this is sent to the other party in secret chats only
    public var thumbnail: InputThumbnail

    /// Photo TTL (Time To Live), in seconds (0-60). A non-zero TTL can be specified only in private chats
    public var ttl: Int

    /// Photo width
    public var width: Int


    public init (
        addedStickerFileIds: [Int],
        caption: FormattedText,
        height: Int,
        photo: InputFile,
        thumbnail: InputThumbnail,
        ttl: Int,
        width: Int) {

        self.addedStickerFileIds = addedStickerFileIds
        self.caption = caption
        self.height = height
        self.photo = photo
        self.thumbnail = thumbnail
        self.ttl = ttl
        self.width = width
    }
}

/// A sticker message
public struct InputMessageSticker: Codable {

    /// Emoji used to choose the sticker
    public var emoji: String

    /// Sticker height
    public var height: Int

    /// Sticker to be sent
    public var sticker: InputFile

    /// Sticker thumbnail, if available
    public var thumbnail: InputThumbnail

    /// Sticker width
    public var width: Int


    public init (
        emoji: String,
        height: Int,
        sticker: InputFile,
        thumbnail: InputThumbnail,
        width: Int) {

        self.emoji = emoji
        self.height = height
        self.sticker = sticker
        self.thumbnail = thumbnail
        self.width = width
    }
}

/// A video message
public struct InputMessageVideo: Codable {

    /// File identifiers of the stickers added to the video, if applicable
    public var addedStickerFileIds: [Int]

    /// Video caption; 0-GetOption("message_caption_length_max") characters
    public var caption: FormattedText

    /// Duration of the video, in seconds
    public var duration: Int

    /// Video height
    public var height: Int

    /// True, if the video should be tried to be streamed
    public var supportsStreaming: Bool

    /// Video thumbnail, if available
    public var thumbnail: InputThumbnail

    /// Video TTL (Time To Live), in seconds (0-60). A non-zero TTL can be specified only in private chats
    public var ttl: Int

    /// Video to be sent
    public var video: InputFile

    /// Video width
    public var width: Int


    public init (
        addedStickerFileIds: [Int],
        caption: FormattedText,
        duration: Int,
        height: Int,
        supportsStreaming: Bool,
        thumbnail: InputThumbnail,
        ttl: Int,
        video: InputFile,
        width: Int) {

        self.addedStickerFileIds = addedStickerFileIds
        self.caption = caption
        self.duration = duration
        self.height = height
        self.supportsStreaming = supportsStreaming
        self.thumbnail = thumbnail
        self.ttl = ttl
        self.video = video
        self.width = width
    }
}

/// A video note message
public struct InputMessageVideoNote: Codable {

    /// Duration of the video, in seconds
    public var duration: Int

    /// Video width and height; must be positive and not greater than 640
    public var length: Int

    /// Video thumbnail, if available
    public var thumbnail: InputThumbnail

    /// Video note to be sent
    public var videoNote: InputFile


    public init (
        duration: Int,
        length: Int,
        thumbnail: InputThumbnail,
        videoNote: InputFile) {

        self.duration = duration
        self.length = length
        self.thumbnail = thumbnail
        self.videoNote = videoNote
    }
}

/// A voice note message
public struct InputMessageVoiceNote: Codable {

    /// Voice note caption; 0-GetOption("message_caption_length_max") characters
    public var caption: FormattedText

    /// Duration of the voice note, in seconds
    public var duration: Int

    /// Voice note to be sent
    public var voiceNote: InputFile

    /// Waveform representation of the voice note, in 5-bit format
    public var waveform: Data


    public init (
        caption: FormattedText,
        duration: Int,
        voiceNote: InputFile,
        waveform: Data) {

        self.caption = caption
        self.duration = duration
        self.voiceNote = voiceNote
        self.waveform = waveform
    }
}

/// A message with a location
public struct InputMessageLocation: Codable {

    /// For live locations, a direction in which the location moves, in degrees; 1-360. Pass 0 if unknown
    public var heading: Int

    /// Period for which the location can be updated, in seconds; should be between 60 and 86400 for a live location and 0 otherwise
    public var livePeriod: Int

    /// Location to be sent
    public var location: Location

    /// For live locations, a maximum distance to another chat member for proximity alerts, in meters (0-100000). Pass 0 if the notification is disabled. Can't be enabled in channels and Saved Messages
    public var proximityAlertRadius: Int


    public init (
        heading: Int,
        livePeriod: Int,
        location: Location,
        proximityAlertRadius: Int) {

        self.heading = heading
        self.livePeriod = livePeriod
        self.location = location
        self.proximityAlertRadius = proximityAlertRadius
    }
}

/// A message with information about a venue
public struct InputMessageVenue: Codable {

    /// Venue to send
    public var venue: Venue


    public init (venue: Venue) {
        self.venue = venue
    }
}

/// A message containing a user contact
public struct InputMessageContact: Codable {

    /// Contact to send
    public var contact: Contact


    public init (contact: Contact) {
        self.contact = contact
    }
}

/// A dice message
public struct InputMessageDice: Codable {

    /// True, if a chat message draft should be deleted
    public var clearDraft: Bool

    /// Emoji on which the dice throw animation is based
    public var emoji: String


    public init (
        clearDraft: Bool,
        emoji: String) {

        self.clearDraft = clearDraft
        self.emoji = emoji
    }
}

/// A message with a game; not supported for channels or secret chats
public struct InputMessageGame: Codable {

    /// User identifier of the bot that owns the game
    public var botUserId: Int

    /// Short name of the game
    public var gameShortName: String


    public init (
        botUserId: Int,
        gameShortName: String) {

        self.botUserId = botUserId
        self.gameShortName = gameShortName
    }
}

/// A message with an invoice; can be used only by bots and only in private chats
public struct InputMessageInvoice: Codable {

    public var description: String

    /// Invoice
    public var invoice: Invoice

    /// The invoice payload
    public var payload: Data

    /// Product photo height
    public var photoHeight: Int

    /// Product photo size
    public var photoSize: Int

    /// Product photo URL; optional
    public var photoUrl: String

    /// Product photo width
    public var photoWidth: Int

    /// JSON-encoded data about the invoice, which will be shared with the payment provider
    public var providerData: String

    /// Payment provider token
    public var providerToken: String

    /// Unique invoice bot start_parameter for the generation of this invoice
    public var startParameter: String

    /// Product title; 1-32 characters
    public var title: String


    public init (
        description: String,
        invoice: Invoice,
        payload: Data,
        photoHeight: Int,
        photoSize: Int,
        photoUrl: String,
        photoWidth: Int,
        providerData: String,
        providerToken: String,
        startParameter: String,
        title: String) {

        self.description = description
        self.invoice = invoice
        self.payload = payload
        self.photoHeight = photoHeight
        self.photoSize = photoSize
        self.photoUrl = photoUrl
        self.photoWidth = photoWidth
        self.providerData = providerData
        self.providerToken = providerToken
        self.startParameter = startParameter
        self.title = title
    }
}

/// A message with a poll. Polls can't be sent to secret chats. Polls can be sent only to a private chat with a bot
public struct InputMessagePoll: Codable {

    /// Point in time (Unix timestamp) when the poll will be automatically closed; for bots only
    public var closeDate: Int

    /// True, if the poll voters are anonymous. Non-anonymous polls can't be sent or forwarded to channels
    public var isAnonymous: Bool

    /// True, if the poll needs to be sent already closed; for bots only
    public var isClosed: Bool

    /// Amount of time the poll will be active after creation, in seconds; for bots only
    public var openPeriod: Int

    /// List of poll answer options, 2-10 strings 1-100 characters each
    public var options: [String]

    /// Poll question; 1-255 characters (up to 300 characters for bots)
    public var question: String

    /// Type of the poll
    public var type: PollType


    public init (
        closeDate: Int,
        isAnonymous: Bool,
        isClosed: Bool,
        openPeriod: Int,
        options: [String],
        question: String,
        type: PollType) {

        self.closeDate = closeDate
        self.isAnonymous = isAnonymous
        self.isClosed = isClosed
        self.openPeriod = openPeriod
        self.options = options
        self.question = question
        self.type = type
    }
}

/// A forwarded message
public struct InputMessageForwarded: Codable {

    /// Options to be used to copy content of the message without a link to the original message
    public var copyOptions: MessageCopyOptions

    /// Identifier for the chat this forwarded message came from
    public var fromChatId: Int64

    /// True, if a game message should be shared within a launched game; applies only to game messages
    public var inGameShare: Bool

    /// Identifier of the message to forward
    public var messageId: Int64


    public init (
        copyOptions: MessageCopyOptions,
        fromChatId: Int64,
        inGameShare: Bool,
        messageId: Int64) {

        self.copyOptions = copyOptions
        self.fromChatId = fromChatId
        self.inGameShare = inGameShare
        self.messageId = messageId
    }
}

