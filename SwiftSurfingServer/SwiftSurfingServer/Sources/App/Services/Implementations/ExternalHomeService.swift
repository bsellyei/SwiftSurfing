//
//  ExternalHomeService.swift
//  
//
//  Created by Séllyei Bence on 2022. 04. 03..
//

import Foundation
import Vapor

class ExternalHomeService: IExternalHomeService {
    let accessToken = "oh.token1.OeBR0gE05A01XKRIz7DnYVl5BMMMRQLLGMk0nvA7D1QQXp0TkH3gjpcHkd5lorQAdeyWT3xpzyiUsds3bGKA"
    let baseURL = "http://localhost:8080/rest/"
    
    let httpClient: Client
    
    init(httpClient: Client) {
        self.httpClient = httpClient
    }
    
    func getAllThings() async throws -> [Thing] {
        let header = HTTPHeaders([("Authorization", "Bearer \(accessToken)")])
        let uri = URI(string: "\(baseURL)/things")
        
        let response = try await httpClient.get(uri, headers: header)
        return try decodeClientResponse(response: response)
    }
    
    func getAllItems() async throws -> [Item] {
        let header = HTTPHeaders([("Authorization", "Bearer \(accessToken)")])
        let uri = URI(string: "\(baseURL)/items?recursive=false")
        
        let response = try await httpClient.get(uri, headers: header)
        return try decodeClientResponse(response: response)
    }
    
    func getItem(name: String) async throws -> Item {
        let header = HTTPHeaders([("Authorization", "Bearer \(accessToken)")])
        let uri = URI(string: "\(baseURL)/items/\(name)")
        
        let response = try await httpClient.get(uri, headers: header)
        return try decodeClientResponse(response: response).first!
    }
    
    func getItemState(name: String) async throws -> String {
        let header = HTTPHeaders([("Authorization", "Bearer \(accessToken)")])
        let uri = URI(string: "\(baseURL)/items/\(name)/state")
        
        let response = try await httpClient.get(uri, headers: header)
        guard response.status == .ok else { throw Abort(.notFound) }
        guard let buffer = response.body else { throw Abort(.badRequest) }
        guard let data = String(buffer: buffer).data(using: .utf8) else { throw Abort(.badRequest) }
        
        return String(decoding: data, as: UTF8.self)
    }
    
    func switchItem(name: String) async throws -> Bool {
        let header = HTTPHeaders([("Authorization", "Bearer \(accessToken)")])
        let uri = URI(string: "\(baseURL)/items/\(name)")
        
        let state = try await getItemState(name: name)
        var newState: String = ""
        if state == "ON" {
            newState = "OFF"
        } else if state == "OFF" {
            newState = "ON"
        }
        
        let response = try await httpClient.post(uri, headers: header) { request in
            try request.content.encode(newState)
        }
        
        return response.status == .ok
    }
    
    func setItemState(name: String, newState: String) async throws -> Bool {
        let header = HTTPHeaders([("Authorization", "Bearer \(accessToken)")])
        let uri = URI(string: "\(baseURL)/items/\(name)")
        
        let response = try await httpClient.post(uri, headers: header) { request in
            try request.content.encode(newState)
        }
        
        return response.status == .ok
    }
    
    func addItem(name: String, label: String, type: String) async throws -> Item {
        let header = HTTPHeaders([("Authorization", "Bearer \(accessToken)")])
        let uri = URI(string: "\(baseURL)/items/\(name)")
        
        let body = CreateItemData(type: type, name: name, label: label)
        let response = try await httpClient.put(uri, headers: header) { request in
            try request.content.encode(body)
        }
        
        return try decodeClientResponse(response: response).first!
    }
    
    func linkItemToChannel(itemName: String, channelId: String) async throws -> Bool {
        let header = HTTPHeaders([("Authorization", "Bearer \(accessToken)")])
        let uri = URI(string: "\(baseURL)/links/\(itemName)/\(channelId)")
        
        let body = CreateLinkData(itemName: itemName, channelId: channelId)
        let response = try await httpClient.put(uri, headers: header) { request in
            try request.content.encode(body)
        }
        
        return response.status == .ok
    }
    
    private func decodeClientResponse<T: Decodable>(response: ClientResponse) throws -> [T] {
        guard response.status == .ok else { throw Abort(.unauthorized) }
        guard let buffer = response.body else { throw Abort(.badRequest) }
        guard let data = String(buffer: buffer).data(using: .utf8) else { throw Abort(.badRequest) }
        
        let decoder: JSONDecoder = JSONDecoder()
        do {
            return try decoder.decode([T].self, from: data)
        } catch {
            throw Abort(.badRequest)
        }
    }
}

struct CreateItemData: Content, Encodable {
    let type: String
    let name: String
    let label: String
}

struct CreateLinkData: Content, Encodable {
    let itemName: String
    let channelId: String
}
