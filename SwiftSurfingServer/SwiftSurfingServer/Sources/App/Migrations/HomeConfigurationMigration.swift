//
//  HomeConfigurationMigration.swift
//  
//
//  Created by Séllyei Bence on 2022. 04. 03..
//

import Foundation
import FluentKit

struct HomeConfigurationMigration: AsyncMigration {
    func prepare(on database: Database) async throws {
        let state = try await database.enum("state")
            .case("on")
            .case("off")
            .create()
        
        let type = try await database.enum("configType")
            .case("heating")
            .case("cooling")
            .case("weatherWatcher")
            .create()
        
        try await database
            .schema("homeConfigurations")
            .id()
            .field("couchId", .uuid, .required, .references("couches", "id"))
            .field("name", .string, .required)
            .field("configType", type, .required)
            .field("itemNames", .array(of: .string))
            .field("state", state, .required)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database
            .schema("homeConfigurations")
            .delete()
        
        try await database.enum("configType")
            .delete()
        
        try await database.enum("state")
            .delete()
    }
}
