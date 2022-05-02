import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }
    
    let userService = UserService(db: app.db)
    let couchService = CouchService(db: app.db)
    let ratingService = RatingService(db: app.db)
    let messageService = MessageService(db: app.db)
    let conversationService = ConversationService(db: app.db)
    let reservationService = ReservationService(db: app.db)

    try app.register(collection: UserController(userService: userService))
    try app.register(collection: CouchController(couchService: couchService))
    try app.register(collection: RatingController(ratingService: ratingService))
    try app.register(collection: MessageController(messageService: messageService))
    try app.register(collection: ConversationController(conversationService: conversationService, userService: userService))
    try app.register(collection: ReservationController(reservationService: reservationService, userService: userService, conversationsService: conversationService, messageService: messageService, couchService: couchService))
    try app.register(collection: HomeController(homeService: HomeService(homeConfigurationService: HomeConfigurationService(db: app.db))))
}
