//
//  ProfilePresenter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 11..
//

import Foundation
import SwiftUI

class ProfilePresenter {
    private let interactor: ProfileInteractor
    private let router: ProfileRouter = ProfileRouter()
    
    init(interactor: ProfileInteractor) {
        self.interactor = interactor
    }
    
    func logout() {
        interactor.logout()
    }
    
    func linkBuilder<Content: View>(@ViewBuilder content: () -> Content)
        -> some View
    {
        NavigationLink(destination: router.makeSmartDevicesView()) {
            content()
        }
    }
}
