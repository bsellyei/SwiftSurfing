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
    let homeService: IHomeService
    
    init(homeService: IHomeService) {
        self.homeService = homeService
    }
    
    func boot(routes: RoutesBuilder) throws {
        let home = routes.grouped("home")
        home.get("items", ":couchId", use: getAllItems)
        home.post("switch", ":itemId", use: switchItem)
    }
    
    func getAllItems(req: Request) async throws -> [HomeConfiguration] {
        return try await homeService.getHomeConfigurations(couchId: req.parameters.get("couchId"))
    }
    
    func switchItem(req: Request) async throws -> HomeConfiguration {
        return try await homeService.switchItem(configurationId: req.parameters.get("itemId"))
    }
}
