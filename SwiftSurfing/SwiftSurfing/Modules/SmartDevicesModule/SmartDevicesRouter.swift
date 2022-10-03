//
//  SmartDevicesRouter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2022. 09. 23..
//

import Foundation
import SwiftUI

class SmartDevicesRouter {
    func makeNewDeviceView() -> some View {
        let interactor = NewSmartDeviceInteractor(couchService: DIContainer.instance.resolve(type: CouchServiceProtocol.self)!, homeService: DIContainer.instance.resolve(type: HomeServiceProtocol.self)!)
        let presenter = NewSmartDevicePresenter(interactor: interactor)
        return NewSmartDeviceView(presenter: presenter)
    }
}
