//
//  TdClient.swift
//  TDLib
//
//  Created by Konstantin Moskalenko on 07.03.2021.
//

import Foundation
import TDLibCore

public final class TdClient {
    public typealias CompletionHandler = (Data) -> Void
    
    private var client: UnsafeMutableRawPointer!
    private let tdlibMainQueue = DispatchQueue(label: "TDLib", qos: .utility)
    private let tdlibQueryQueue = DispatchQueue(label: "TDLibQuery", qos: .userInitiated)
    private let completionQueue: DispatchQueue
    private var queryId: Int64 = 0
    private var awaitingCompletions = [Int64: CompletionHandler]()
    private var updateHandler: ((Data) -> Void)?
    private let logger: Logger?
    private var isClientDestroyed = true
    private var stopFlag = false
    
    
    /// Instantiate a Tdlib Client
    ///
    /// - Parameter completionQueue: The serial operation queue used to dispatch all completion handlers. `.main` by default.
    /// - Parameter logger: The logger object for debug print all queries and responses
    public init(completionQueue: DispatchQueue = .main, logger: Logger? = nil) {
        self.completionQueue = completionQueue
        self.logger = logger
    }
    
    deinit {
        close()
    }
    
    public func close() {
        guard !isClientDestroyed else { return }
        if !stopFlag {
            send(query: DTO(Close()), completion: { _ in })
        }
        // TODO: correct destroy client
        isClientDestroyed = true
        // td_json_client_destroy(client)
    }
    
    /// Receives incoming updates and request responses from the TDLib client
    public func run(updateHandler: @escaping CompletionHandler) {
        self.updateHandler = updateHandler
        createClientIfNeeded()
        
        tdlibMainQueue.async { [unowned self] in
            guard !self.isClientDestroyed else { return }
            
            while (!self.stopFlag) {
                guard
                    let res = td_json_client_receive(self.client, 10),
                    let data = String(cString: res).data(using: .utf8)
                else {
                    continue
                }
                self.logger?.log(String(cString: res), type: .receive)
                self.queryResultAsync(data)
            }
        }
    }
    
    /// Sends request to the TDLib client.
    public func send(query: TdQuery, completion: (CompletionHandler)? = nil) {
        guard !self.isClientDestroyed else { return }
        
        tdlibQueryQueue.async { [weak self] in
            guard let `self` = self else { return }
            var extra: String? = nil
            if let completion = completion {
                let nextQueryId = self.queryId + 1
                extra = "\(nextQueryId)"
                self.awaitingCompletions[nextQueryId] = completion
                self.queryId = nextQueryId
            }
            if let data = try? query.make(with: extra),
               let str = String(data: data, encoding: .utf8) {
                self.logger?.log(str, type: .send)
                td_json_client_send(self.client, str)
            }
        }
    }
    
    /// Synchronously executes TDLib request.
    public func execute(query: TdQuery) {
        guard !self.isClientDestroyed else { return }
        
        if let data = try? query.make(with: nil),
           let str = String(data: data, encoding: .utf8) {
            logger?.log(str, type: .execute)
            if let res = td_json_client_execute(client, str) {
                logger?.log(String(cString: res), type: .receive)
            }
        }
    }
    
    // MARK: - Private methods
    
    private func createClientIfNeeded() {
        if isClientDestroyed {
            client = td_json_client_create()
            isClientDestroyed = false
        }
    }
    
    private func queryResultAsync(_ result: Data) {
        tdlibQueryQueue.async { [weak self] in
            guard
                let `self` = self,
                let json = try? JSONSerialization.jsonObject(with: result, options:[]),
                let dictionary = json as? [String:Any]
            else {
                return
            }
            
            if let extraStr = dictionary["@extra"] as? String,
               let extra = Int64(extraStr) {
                if let completion = self.awaitingCompletions[extra] {
                    self.completionQueue.async {
                        completion(result)
                    }
                    self.awaitingCompletions.removeValue(forKey: extra)
                }
            } else {
                if self.checkClosingUpdate(dictionary) {
                    self.stopFlag = true
                }
                self.completionQueue.async {
                    self.updateHandler?(result)
                }
            }
        }
    }
    
    private func checkClosingUpdate(_ dict: [String: Any]) -> Bool {
        if let state = dict["authorization_state"] as? [String: Any],
           (state["@type"] as? String) == "authorizationStateClosed" {
            return true
        }
        return false
    }
}

public protocol TdQuery {
    func make(with extra: String?) throws -> Data
}
