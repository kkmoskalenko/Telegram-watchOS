//
//  WebPage.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation


/// Describes a web page preview
public struct WebPage: Codable {

    /// Preview of the content as an animation, if available; may be null
    public var animation: Animation?

    /// Preview of the content as an audio file, if available; may be null
    public var audio: Audio?

    /// Author of the content
    public var author: String

    public var description: FormattedText

    /// URL to display
    public var displayUrl: String

    /// Preview of the content as a document, if available (currently only available for small PDF files and ZIP archives); may be null
    public var document: Document?

    /// Duration of the content, in seconds
    public var duration: Int

    /// Height of the embedded preview
    public var embedHeight: Int

    /// MIME type of the embedded preview, (e.g., text/html or video/mp4)
    public var embedType: String

    /// URL to show in the embedded preview
    public var embedUrl: String

    /// Width of the embedded preview
    public var embedWidth: Int

    /// Version of instant view, available for the web page (currently can be 1 or 2), 0 if none
    public var instantViewVersion: Int

    /// Image representing the content; may be null
    public var photo: Photo?

    /// Short name of the site (e.g., Google Docs, App Store)
    public var siteName: String

    /// Preview of the content as a sticker for small WEBP files, if available; may be null
    public var sticker: Sticker?

    /// Title of the content
    public var title: String

    /// Type of the web page. Can be: article, photo, audio, video, document, profile, app, or something else
    public var type: String

    /// Original URL of the link
    public var url: String

    /// Preview of the content as a video, if available; may be null
    public var video: Video?

    /// Preview of the content as a video note, if available; may be null
    public var videoNote: VideoNote?

    /// Preview of the content as a voice note, if available; may be null
    public var voiceNote: VoiceNote?


    public init (
        animation: Animation?,
        audio: Audio?,
        author: String,
        description: FormattedText,
        displayUrl: String,
        document: Document?,
        duration: Int,
        embedHeight: Int,
        embedType: String,
        embedUrl: String,
        embedWidth: Int,
        instantViewVersion: Int,
        photo: Photo?,
        siteName: String,
        sticker: Sticker?,
        title: String,
        type: String,
        url: String,
        video: Video?,
        videoNote: VideoNote?,
        voiceNote: VoiceNote?) {

        self.animation = animation
        self.audio = audio
        self.author = author
        self.description = description
        self.displayUrl = displayUrl
        self.document = document
        self.duration = duration
        self.embedHeight = embedHeight
        self.embedType = embedType
        self.embedUrl = embedUrl
        self.embedWidth = embedWidth
        self.instantViewVersion = instantViewVersion
        self.photo = photo
        self.siteName = siteName
        self.sticker = sticker
        self.title = title
        self.type = type
        self.url = url
        self.video = video
        self.videoNote = videoNote
        self.voiceNote = voiceNote
    }
}

