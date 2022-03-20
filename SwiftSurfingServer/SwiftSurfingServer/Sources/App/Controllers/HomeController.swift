//
//  File.swift
//  
//
//  Created by Séllyei Bence on 2022. 03. 19..
//

import Foundation
import Vapor
import Fluent

struct HomeController: RouteCollection {
    let accessToken = "oh.token1.OeBR0gE05A01XKRIz7DnYVl5BMMMRQLLGMk0nvA7D1QQXp0TkH3gjpcHkd5lorQAdeyWT3xpzyiUsds3bGKA"
    let baseURL = "http://localhost:8080/rest/"
    
    func boot(routes: RoutesBuilder) throws {
        let home = routes.grouped("home")
        home.get("things", use: getAllThings)
        home.get("items", use: getAllItems)
        home.get("item", ":itemName", use: getItem)
        home.get("state", ":itemName", use: getItemState)
        home.post("switch", ":itemName", use: switchItem)
    }
    
    func getAllThings(req: Request) async throws -> [Thing] {
        let header = HTTPHeaders([("Authorization", "Bearer \(accessToken)")])
        let uri = URI(string: "\(baseURL)/things")
        
        let response = try await req.client.get(uri, headers: header)
        return try decodeClientResponse(response: response)
        
    }
    
    func getAllItems(req: Request) async throws -> [Item] {
        let header = HTTPHeaders([("Authorization", "Bearer \(accessToken)")])
        let uri = URI(string: "\(baseURL)/items?recursive=false")
        
        let response = try await req.client.get(uri, headers: header)
        return try decodeClientResponse(response: response)
    }
    
    func getItem(req: Request) async throws -> Item {
        let itemName = req.parameters.get("itemName")!
        
        let header = HTTPHeaders([("Authorization", "Bearer \(accessToken)")])
        let uri = URI(string: "\(baseURL)/items/\(itemName)")
        
        let response = try await req.client.get(uri, headers: header)
        return try decodeClientResponse(response: response).first!
    }
    
    func getItemState(req: Request) async throws -> String {
        let itemName = req.parameters.get("itemName")!
        
        let header = HTTPHeaders([("Authorization", "Bearer \(accessToken)")])
        let uri = URI(string: "\(baseURL)/items/\(itemName)/state")
        
        let response = try await req.client.get(uri, headers: header)
        guard response.status == .ok else { throw Abort(.notFound) }
        guard let buffer = response.body else { throw Abort(.badRequest) }
        guard let data = String(buffer: buffer).data(using: .utf8) else { throw Abort(.badRequest) }
        
        return String(decoding: data, as: UTF8.self)
    }
    
    func switchItem(req: Request) async throws -> HTTPStatus {
        let itemName = req.parameters.get("itemName")!
        
        let header = HTTPHeaders([("Authorization", "Bearer \(accessToken)")])
        let uri = URI(string: "\(baseURL)/items/\(itemName)")
        
        let state = try await getItemState(req: req)
        var newState: String = ""
        if state == "ON" {
            newState = "OFF"
        } else if state == "OFF" {
            newState = "ON"
        }
        
        let response = try await req.client.post(uri, headers: header) { request in
            try request.content.encode(newState)
        }
        
        return response.status
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
