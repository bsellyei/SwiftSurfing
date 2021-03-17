//
//  CouchesPresenter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 16..
//

import Foundation
import SwiftUI

class CouchesPresenter: ObservableObject {
    private let interactor: CouchesInteractor
    private let router = CouchesRouter()
    
    init(interactor: CouchesInteractor) {
        self.interactor = interactor
    }
    
    func linkBuilder<Content: View>(@ViewBuilder content: () -> Content)
        -> some View
    {
        NavigationLink(destination: router.makeNewCouchView()) {
            content()
        }
    }
}
