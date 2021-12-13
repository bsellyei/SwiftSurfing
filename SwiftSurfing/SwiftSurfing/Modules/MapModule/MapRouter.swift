//
//  MapRouter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 12..
//

import Foundation
import SwiftUI

class MapRouter {
    func makeCouchDetailsView(couch: Couch) -> some View {
        let interactor = CouchDetailsInteractor(userService: DIContainer.instance.resolve(type: UserServiceProtocol.self)!)
        let presenter = CouchDetailsPresenter(interactor: interactor, couch: couch)
        return CouchDetailsView(presenter: presenter)
    }
}
