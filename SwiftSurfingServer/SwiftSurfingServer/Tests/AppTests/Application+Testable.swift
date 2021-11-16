//
//  Application+Testable.swift
//  
//
//  Created by Séllyei Bence on 2021. 11. 15..
//

import XCTVapor
import App

extension Application {
    static func testable() throws -> Application {
        let app = Application(.testing)
        try configure(app)
        
        try app.autoRevert().wait()
        try app.autoMigrate().wait()
        
        return app
    }
}
