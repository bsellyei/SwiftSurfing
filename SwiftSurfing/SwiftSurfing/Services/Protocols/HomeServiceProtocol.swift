//
//  HomeServiceProtocol.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2022. 05. 23..
//

import Foundation

protocol HomeServiceProtocol {
    func getAllItems(couchId: String, completion: @escaping ([HomeConfiguration]) -> Void)
    
    func switchItem(id: String, completion: @escaping (Bool) -> Void)
}
