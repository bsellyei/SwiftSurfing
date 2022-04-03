import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    try app.register(collection: UserController(userService: UserService(db: app.db)))
    try app.register(collection: CouchController(couchService: CouchService(db: app.db)))
    try app.register(collection: RatingController(ratingService: RatingService(db: app.db)))
    try app.register(collection: MessageController(messageService: MessageService(db: app.db)))
    try app.register(collection: ConversationController(conversationService: ConversationService(db: app.db), userService: UserService(db: app.db)))
    try app.register(collection: HomeController(homeService: HomeService(homeConfigurationService: HomeConfigurationService(db: app.db))))
}
