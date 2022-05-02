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
        let type = try await database.enum("configType")
            .case("heating")
            .case("cooling")
            .case("weatherWatcher")
            .create()
        
        let status = try await database.enum("status")
            .case("on")
            .case("off")
            .create()
        
        try await database
            .schema("homeConfigurations")
            .id()
            .field("couchId", .uuid, .required, .references("couches", "id"))
            .field("configType", type, .required)
            .field("status", status, .required)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database
            .schema("homeConfigurations")
            .delete()
    }
}
