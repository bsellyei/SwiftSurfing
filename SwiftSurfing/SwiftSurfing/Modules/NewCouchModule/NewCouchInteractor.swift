//
//  NewCouchInteractor.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 16..
//

import Foundation
import Firebase
import CoreData

class NewCouchInteractor {
    private let service: CouchServiceProtocol
    private let imageManager: ImageManagerProtocol
    
    init(couchService: CouchServiceProtocol, imageManager: ImageManagerProtocol) {
        self.service = couchService
        self.imageManager = imageManager
    }
    
    func addNew(couch: Couch, images: [UIImage], completion: @escaping (Bool) -> Void) {
        self.service.addNew(couch: couch, completion: completion)
        
        let semaphore = DispatchSemaphore(value: 0)
        if images.count != 0 {
            var i = 0
            for image in images {
                let id = couch.id + " - \(i)"
                DispatchQueue.global(qos: .background).async {
                    self.uploadImage(id: id, couch: couch, image: image) {
                        semaphore.signal()
                    }
                }
                i += 1
                semaphore.wait()
            }
            
            couch.imageURLs.removeFirst()
            
            self.service.update(couch: couch) { success in
                if success {
                    print("imageURLs added")
                }
            }
        }
    }
    
    private func uploadImage(id: String, couch: Couch, image: UIImage, completion: @escaping () -> Void) {
        imageManager.uploadImage(id: id, image: image) { (success, downloadURL) in
            if success {
                couch.imageURLs.append(downloadURL)
                completion()
            }
        }
    }
}
