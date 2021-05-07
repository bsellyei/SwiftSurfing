//
//  ImageManager.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 04. 29..
//

import Foundation
import FirebaseStorage
import UIKit
import FirebaseAuth

class ImageManager: ImageManagerProtocol {
    private var storageRef: StorageReference?
    
    private let storageUrl = "gs://swiftsurfing-52ae5.appspot.com"
    
    init() {
        self.storageRef = Storage.storage().reference()
    }
    
    func uploadImage(id: String, image: UIImage, completion: @escaping (Bool, String) -> Void) {
        let data = image.pngData()! as Data
        let filePath = id
        storageRef?.child(filePath).putData(data, metadata: nil) { (metadata, error) in
            if error == nil {
                self.storageRef?.child(filePath).downloadURL() { (url, error) in
                    if error == nil {
                        DispatchQueue.main.async {
                            completion(true, url?.absoluteString ?? "")
                        }
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completion(false, "")
                }
            }
        }
    }
    
    func downloadImage(url: String, completion: @escaping (UIImage) -> Void) {
        
    }
}
