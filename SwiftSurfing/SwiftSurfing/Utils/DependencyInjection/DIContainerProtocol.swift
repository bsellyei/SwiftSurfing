//
//  DIContainerProtocol.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 24..
//

import Foundation

protocol DIContainerProtocol {
    func register<Component>(type: Component.Type, component: Any)
    
    func resolve<Component>(type: Component.Type) -> Component?
}
