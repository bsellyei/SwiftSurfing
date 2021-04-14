//
//  CouchesPresenter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 16..
//

import Foundation
import SwiftUI
import Combine

class CouchesPresenter: ObservableObject {
    private let interactor: CouchesInteractor
    private let router = CouchesRouter()
    
    @Published var couches: [Couch] = []
    
    init(interactor: CouchesInteractor) {
        self.interactor = interactor
    }
    
    func getCouches() {
        DispatchQueue.global(qos: .background).async {
            self.interactor.getCouches(completion: { couches in
                self.couches = couches
            })
        }
    }
    
    func linkBuilder<Content: View>(@ViewBuilder content: () -> Content)
        -> some View
    {
        NavigationLink(destination: router.makeNewCouchView()) {
            content()
        }
    }
}
