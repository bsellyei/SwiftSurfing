//
//  IExternalHomeService.swift
//  
//
//  Created by Séllyei Bence on 2022. 04. 03..
//

import Foundation

protocol IExternalHomeService {
    func getAllThings() async throws -> [Thing]
    
    func getItem(name: String) async throws -> Item
    
    func setItemState(name: String, newState: String) async throws -> Bool
    
    func addItem(name: String, label: String, type: String) async throws -> Item
    
    func linkItemToChannel(itemName: String, channelId: String) async throws -> Bool
}
