//
//  TdApi.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

public final class TdApi {
    public let client: TdClient
    public let encoder = JSONEncoder()
    public let decoder = JSONDecoder()
    
    public init(client: TdClient) {
        self.client = client
        self.encoder.keyEncodingStrategy = .convertToSnakeCase
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    /// Sets the parameters for TDLib initialization. Works only when the current authorization state is authorizationStateWaitTdlibParameters
    /// - Parameter parameters: Parameters
    public func setTdlibParameters(
        parameters: TdlibParameters,
        completion: @escaping (Result<Ok, Swift.Error>) -> Void) throws {
        
        let query = SetTdlibParameters(
            parameters: parameters
        )
        execute(query: query, completion: completion)
    }
    
    /// Checks the database encryption key for correctness. Works only when the current authorization state is authorizationStateWaitEncryptionKey
    /// - Parameter encryptionKey: Encryption key to check or set up
    public func checkDatabaseEncryptionKey(
        encryptionKey: Data,
        completion: @escaping (Result<Ok, Swift.Error>) -> Void) throws {
        
        let query = CheckDatabaseEncryptionKey(
            encryptionKey: encryptionKey
        )
        execute(query: query, completion: completion)
    }
    
    /// Requests QR code authentication by scanning a QR code on another logged in device. Works only when the current authorization state is authorizationStateWaitPhoneNumber, or if there is no pending authentication query and the current authorization state is authorizationStateWaitCode, authorizationStateWaitRegistration, or authorizationStateWaitPassword
    /// - Parameter otherUserIds: List of user identifiers of other users currently using the application
    public func requestQrCodeAuthentication(
        otherUserIds: [Int],
        completion: @escaping (Result<Ok, Swift.Error>) -> Void) throws {
        
        let query = RequestQrCodeAuthentication(
            otherUserIds: otherUserIds
        )
        execute(query: query, completion: completion)
    }
    
    /// Checks the authentication password for correctness. Works only when the current authorization state is authorizationStateWaitPassword
    /// - Parameter password: The password to check
    public func checkAuthenticationPassword(
        password: String,
        completion: @escaping (Result<Ok, Swift.Error>) -> Void) throws {
        
        let query = CheckAuthenticationPassword(
            password: password
        )
        execute(query: query, completion: completion)
    }
    
    /// Returns an ordered list of chats in a chat list. Chats are sorted by the pair (chat.position.order, chat.id) in descending order. (For example, to get a list of chats from the beginning, the offset_order should be equal to a biggest signed 64-bit number 9223372036854775807 == 2^63 - 1). For optimal performance the number of returned chats is chosen by the library
    /// - Parameter chatList: The chat list in which to return chats
    /// - Parameter limit: The maximum number of chats to be returned. It is possible that fewer chats than the limit are returned even if the end of the list is not reached
    /// - Parameter offsetChatId: Chat identifier to return chats from
    /// - Parameter offsetOrder: Chat order to return chats from
    public func getChats(
        chatList: ChatList,
        limit: Int,
        offsetChatId: Int64,
        offsetOrder: TdInt64,
        completion: @escaping (Result<Chats, Swift.Error>) -> Void) throws {
        
        let query = GetChats(
            chatList: chatList,
            limit: limit,
            offsetChatId: offsetChatId,
            offsetOrder: offsetOrder
        )
        execute(query: query, completion: completion)
    }
    
    /// Downloads a file from the cloud. Download progress and completion of the download will be notified through updateFile updates
    /// - Parameter fileId: Identifier of the file to download
    /// - Parameter limit: Number of bytes which should be downloaded starting from the "offset" position before the download will be automatically cancelled; use 0 to download without a limit
    /// - Parameter offset: The starting position from which the file should be downloaded
    /// - Parameter priority: Priority of the download (1-32). The higher the priority, the earlier the file will be downloaded. If the priorities of two files are equal, then the last one for which downloadFile was called will be downloaded first
    /// - Parameter synchronous: If false, this request returns file state just after the download has been started. If true, this request returns file state only after//-the download has succeeded, has failed, has been cancelled or a new downloadFile request with different offset/limit parameters was sent
    public func downloadFile(
        fileId: Int,
        limit: Int,
        offset: Int,
        priority: Int,
        synchronous: Bool,
        completion: @escaping (Result<File, Swift.Error>) -> Void) throws {
        
        let query = DownloadFile(
            fileId: fileId,
            limit: limit,
            offset: offset,
            priority: priority,
            synchronous: synchronous
        )
        execute(query: query, completion: completion)
    }
    
    private func execute<Q, R>(
        query: Q,
        completion: @escaping (Result<R, Swift.Error>) -> Void)
    where Q: Codable, R: Codable {
        let dto = DTO(query, encoder: self.encoder)
        client.send(query: dto) { [weak self] result in
            guard let self = self else { return }
            if let error = try? self.decoder.decode(DTO<Error>.self, from: result) {
                completion(.failure(error.payload))
            }
            let response = self.decoder.tryDecode(DTO<R>.self, from: result)
            completion(response.map { $0.payload })
        }
    }
}
