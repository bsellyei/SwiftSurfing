//
//  RootPresenter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 14..
//

import Foundation

class RootPresenter: ObservableObject {
    private let interactor: RootInteractor
    
    init(interactor: RootInteractor) {
        self.interactor = interactor
    }
    
    lazy var isLoggedIn: Bool = {
        return interactor.isLoggedIn()
    }()
}
