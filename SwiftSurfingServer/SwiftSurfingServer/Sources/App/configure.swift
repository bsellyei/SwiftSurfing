import Fluent
import FluentPostgresDriver
import Queues
import QueuesRedisDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // Middlewares
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // DB & Migrations
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

    app.migrations.add(UserMigration())
    app.migrations.add(CouchMigration())
    app.migrations.add(RatingMigration())
    app.migrations.add(ConversationMigration())
    app.migrations.add(MessageMigration())
    app.migrations.add(UserConversationPivotMigration())
    app.migrations.add(ReservationMigration())
    app.migrations.add(HomeConfigurationMigration())
    app.migrations.add(SeedMigration())
    try app.autoMigrate().wait()
    
    // Logging
    app.logger.logLevel = .debug
    
    // Jobs
    try app.queues.use(.redis(url: "redis://127.0.0.1:6379"))
    app.queues.schedule(WeatherJob(weatherService: WeatherService(httpClient: app.client), homeConfigurationService: HomeConfigurationService(db: app.db))).hourly().at(5)
    try app.queues.startScheduledJobs()
    
    // Other
    app.http.server.configuration.port = 8081

    // Routes
    try routes(app)
}
