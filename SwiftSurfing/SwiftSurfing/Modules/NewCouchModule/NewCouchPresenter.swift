//
//  NewCouchPresenter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 16..
//

import Foundation
import SwiftUI

class NewCouchPresenter: ObservableObject {
    private var interactor: NewCouchInteractor
    
    @Published var name: String
    @Published var address: String
    @Published var city: String
    @Published var country: String
    @Published var maxGuests: Int
    @Published var description: String
    @Published var tags: String
    @Published var addedImages = [UIImage]()
    
    @Published var showAlert: Bool
    
    init(interactor: NewCouchInteractor) {
        self.interactor = interactor
        self.name = ""
        self.address = ""
        self.city = ""
        self.country = ""
        self.maxGuests = 1
        self.description = ""
        self.tags = ""
        
        self.showAlert = false
    }
    
    func addNewCouch() {
        let couch = Couch()
        couch.name = self.name
        couch.address = self.address
        couch.city = self.city
        couch.country = self.country
        couch.maxGuests = self.maxGuests
        couch.description = self.description
        couch.tags = self.tags
        
        DispatchQueue.global(qos: .background).async {
            self.interactor.addNew(couch: couch, images: self.addedImages, completion: { success in
                self.showAlert = !success
            })
        }
    }
}