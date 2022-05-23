//
//  HomeService.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2022. 05. 23..
//

import Foundation

class HomeService: HomeServiceProtocol {
    func getAllItems(couchId: String, completion: @escaping ([HomeConfiguration]) -> Void) {
        HomeAPI.findAllHomeItemsForUser(couchId: couchId, completion: { result, error in
            if error == nil && result != nil {
                completion(result!)
            }
        })
    }
    
    func switchItem(id: String, completion: @escaping (Bool) -> Void) {
        HomeAPI.switchItem(itemId: id, completion: { _, error in
            if error == nil {
                completion(true)
            }
        })
    }
}
