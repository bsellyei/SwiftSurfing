import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    let databaseName: String
    let databasePort: Int
    
    if app.environment == .testing {
        databaseName = "vapor-test"
        databasePort = 5433
    } else {
        databaseName = "vapor_database"
        databasePort = 5432
    }
    
    app.databases.use(.postgres(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: databasePort,
        username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
        password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
        database: Environment.get("DATABASE_NAME") ?? databaseName
    ), as: .psql)

    app.migrations.add(CreateTodo())
    app.migrations.add(UserMigration())
    app.migrations.add(CouchMigration())
    app.migrations.add(RatingMigration())
    app.migrations.add(ConversationMigration())
    app.migrations.add(MessageMigration())
    app.migrations.add(UserConversationPivotMigration())
    
    app.logger.logLevel = .debug
    
    try app.autoMigrate().wait()

    // register routes
    try routes(app)
}