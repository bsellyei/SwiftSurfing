//
//  ImageManagerProtocol.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 04. 29..
//

import Foundation
import SwiftUI

protocol ImageManagerProtocol {
    func uploadImage(id: String, image: UIImage, completion: @escaping (Bool, String) -> Void)
    
    func downloadImage(url: String, completion: @escaping(UIImage) -> Void)
}
