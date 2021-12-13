//
//  CouchesRouter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 16..
//

import Foundation
import SwiftUI

class CouchesRouter {
    func makeNewCouchView() -> some View {
        let interactor = NewCouchInteractor(couchService: DIContainer.instance.resolve(type: CouchServiceProtocol.self)!,
                                            imageManager: DIContainer.instance.resolve(type: ImageManagerProtocol.self)!)
        let presenter = NewCouchPresenter(interactor: interactor)
        return NewCouchView(presenter: presenter)
    }
    
    func makeCouchDetailsView(couch: Couch) -> some View {
        let interactor = CouchDetailsInteractor(userService: DIContainer.instance.resolve(type: UserServiceProtocol.self)!)
        let presenter = CouchDetailsPresenter(interactor: interactor, couch: couch)
        return CouchDetailsView(presenter: presenter)
    }
}
