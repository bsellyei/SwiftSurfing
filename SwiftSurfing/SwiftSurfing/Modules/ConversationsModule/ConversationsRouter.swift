//
//  ConversationRouter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 12..
//

import Foundation
import SwiftUI

class ConversationsRouter {
    func makeMessagesView(conversation: Conversation) -> some View {
        let interactor = MessagesInteractor(messageService: DIContainer.instance.resolve(type: MessageServiceProtocol.self)!,
                                            userService: DIContainer.instance.resolve(type: UserServiceProtocol.self)!)
        let presenter = MessagesPresenter(interactor: interactor, conversation: conversation)
        return MessagesView(presenter: presenter)
    }
}
