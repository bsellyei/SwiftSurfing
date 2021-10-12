//
//  ProfilePresenter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 11..
//

import Foundation

class ProfilePresenter {
    private let interactor: ProfileInteractor
    
    init(interactor: ProfileInteractor) {
        self.interactor = interactor
    }
    
    func logout() {
        interactor.logout()
    }
}
