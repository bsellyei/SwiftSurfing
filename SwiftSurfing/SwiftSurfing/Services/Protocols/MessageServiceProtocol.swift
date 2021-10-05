//
//  MessageServiceProtocol.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 09. 29..
//

import Foundation

protocol MessageServiceProtocol {
    func send(message: Message, completion: @escaping (Bool) -> Void)
    
    func get(id: String, completion: @escaping (Message?) -> Void)
}
