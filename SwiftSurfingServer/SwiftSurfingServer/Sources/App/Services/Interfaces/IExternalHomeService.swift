//
//  IExternalHomeService.swift
//  
//
//  Created by Séllyei Bence on 2022. 04. 03..
//

import Foundation

protocol IExternalHomeService {
    func getAllThings() async throws -> [Thing]
    
    func getAllItems() async throws -> [Item]
    
    func getItem(name: String) async throws -> Item
    
    func getItemState(name: String) async throws -> String
    
    func switchItem(name: String) async throws -> Bool
}
