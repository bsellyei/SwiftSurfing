//
//  IMessageService.swift
//  
//
//  Created by Séllyei Bence on 2022. 03. 31..
//

import Foundation
import Fluent

//sourcery: AutoMockable
protocol IMessageService {
    func getMessages(conversationId: String?) async throws -> [Message]
    
    func createMessage(message: Message) async throws -> Message
    
    func deleteMessage(id: String?) async throws -> Bool
}
