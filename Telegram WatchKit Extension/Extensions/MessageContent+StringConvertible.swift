//
//  MessageContent+StringConvertible.swift
//  Telegram WatchKit Extension
//
//  Created by Konstantin Moskalenko on 17.03.2021.
//

import TDLib

extension MessageContent: CustomStringConvertible {
    public var description: String {
        switch self {
            case .messageText(let value):
                return value.text.text
            case .messageAnimation(let value):
                let caption = value.caption.text
                return caption.isEmpty ?
                    "GIF" : "🖼 \(caption)"
            case .messageAudio(let value):
                let caption = value.caption.text
                return caption.isEmpty ?
                    value.audio.title : "🎤 \(caption)"
            case .messageDocument(let value):
                let caption = value.caption.text
                let fileName = value.document.fileName
                return caption.isEmpty ?
                    fileName : "📎 \(caption)"
            case .messagePhoto(let value):
                let caption = value.caption.text
                return caption.isEmpty ?
                    "Photo" : "🖼 \(caption)"
            case .messageExpiredPhoto:
                return "Photo has expired"
            case .messageSticker(let value):
                return "\(value.sticker.emoji) Sticker"
            case .messageVideo(let value):
                let caption = value.caption.text
                return caption.isEmpty ?
                    "Video" : "📹 \(caption)"
            case .messageExpiredVideo:
                return "Video has expired"
            case .messageVideoNote(_):
                return "Video Message"
            case .messageVoiceNote(let value):
                let caption = value.caption.text
                return caption.isEmpty ?
                    "Voice Message" : "🎤 \(caption)"
            case .messageLocation(_):
                return "Location"
            case .messageVenue(_):
                return "Venue"
            case .messageContact(_):
                return "Contact"
            case .messageDice(let value):
                return value.emoji
            case .messageGame(let value):
                return "🎮 \(value.game.title)"
            case .messagePoll(let value):
                return "📊 \(value.poll.question)"
            case .messageInvoice(let invoice):
                return invoice.title
            case .messageCall(let call):
                return call.isVideo ?
                    "Video" : "Audio" + " Call"
            case .messageVoiceChatStarted(_),
                 .messageVoiceChatEnded(_),
                 .messageInviteVoiceChatParticipants(_):
                return "Voice Chat"
            case .messageContactRegistered:
                return "Joined Telegram"
            case .messageChatJoinByLink:
                return "Joined the group"
                
            default: return ""
        }
    }
}
