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
        let interactor = NewCouchInteractor(couchService: DIContainer.instance.resolve(type: CouchServiceProtocol.self)!)
        let presenter = NewCouchPresenter(interactor: interactor)
        return NewCouchView(presenter: presenter)
    }
}
