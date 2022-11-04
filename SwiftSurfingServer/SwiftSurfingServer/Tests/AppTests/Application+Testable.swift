//
//  Application+Testable.swift
//  
//
//  Created by Séllyei Bence on 2021. 11. 15..
//

import XCTVapor
@testable import App
import XCTQueues

extension Application {
    static func testable() throws -> Application {
        let app = Application(.testing)
        try configureTest(app)
        
        try app.autoRevert().wait()
        try app.autoMigrate().wait()
        
        return app
    }
    
    static func configureTest(_ app: Application) throws {
        // DB & Migrations        
        let databaseName = "vapor-test"
        let databasePort = 5433
        
        app.databases.use(.postgres(
            hostname: Environment.get("DATABASE_HOST") ?? "localhost",
            port: databasePort,
            username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
            password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
            database: Environment.get("DATABASE_NAME") ?? databaseName
        ), as: .psql)

        app.migrations.add(UserMigration())
        app.migrations.add(CouchMigration())
        app.migrations.add(RatingMigration())
        app.migrations.add(ConversationMigration())
        app.migrations.add(MessageMigration())
        app.migrations.add(UserConversationPivotMigration())
        app.migrations.add(ReservationMigration())
        app.migrations.add(HomeConfigurationMigration())
        
        // Logging
        app.logger.logLevel = .debug
        
        // Jobs
        app.queues.use(.test)
        
        // Other
        app.http.server.configuration.port = 8081

        // Routes
        try routesTest(app)
    }
    
    static func routesTest(_ app: Application) throws {
        let userService = UserService(db: app.db)
        let couchService = CouchService(db: app.db)
        let ratingService = RatingService(db: app.db)
        let messageService = MessageService(db: app.db)
        let conversationService = ConversationService(db: app.db)
        let reservationService = ReservationService(db: app.db)
        let homeConfigurationService = HomeConfigurationService(db: app.db)

        try app.register(collection: UserController(userService: userService))
        try app.register(collection: CouchController(couchService: couchService, homeConfigurationService: homeConfigurationService))
        try app.register(collection: RatingController(ratingService: ratingService))
        try app.register(collection: MessageController(messageService: messageService))
        try app.register(collection: ConversationController(conversationService: conversationService, userService: userService))
        try app.register(collection: ReservationController(reservationService: reservationService, userService: userService, conversationsService: conversationService, messageService: messageService, couchService: couchService))
    }
}
