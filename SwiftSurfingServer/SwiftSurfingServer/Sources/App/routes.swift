import Fluent
import Vapor

func routes(_ app: Application) throws {
    let userService = UserService(db: app.db)
    let couchService = CouchService(db: app.db)
    let ratingService = RatingService(couchService: couchService, db: app.db)
    let messageService = MessageService(db: app.db)
    let conversationService = ConversationService(db: app.db)
    let reservationService = ReservationService(db: app.db)
    let homeConfigurationService = HomeConfigurationService(db: app.db)
    let externalHomeService = ExternalHomeService(httpClient: app.client)

    try app.register(collection: UserController(userService: userService))
    try app.register(collection: CouchController(couchService: couchService, homeConfigurationService: homeConfigurationService))
    try app.register(collection: RatingController(ratingService: ratingService))
    try app.register(collection: MessageController(messageService: messageService))
    try app.register(collection: ConversationController(conversationService: conversationService, userService: userService))
    try app.register(collection: ReservationController(reservationService: reservationService, userService: userService, conversationsService: conversationService, messageService: messageService, couchService: couchService))
    try app.register(collection: HomeController(homeService: HomeService(homeConfigurationService: homeConfigurationService,
                                                                         externalHomeService: externalHomeService)))
}
