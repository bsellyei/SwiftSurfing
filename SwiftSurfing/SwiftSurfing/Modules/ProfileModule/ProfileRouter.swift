//
//  ProfileRouter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2022. 05. 23..
//

import Foundation
import SwiftUI

class ProfileRouter {
    func makeSmartDevicesView() -> some View {
        let interactor = SmartDevicesInteractor(couchService: DIContainer.instance.resolve(type: CouchServiceProtocol.self)!,                                       homeService: DIContainer.instance.resolve(type: HomeServiceProtocol.self)!)
        
        let presenter = SmartDevicesPresenter(interactor: interactor)
        return SmartDevicesView(presenter: presenter)
    }
}
