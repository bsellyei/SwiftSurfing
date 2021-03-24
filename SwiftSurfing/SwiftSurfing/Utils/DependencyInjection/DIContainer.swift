//
//  DIContainer.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 24..
//
//  source: https://www.raywenderlich.com/14223279-dependency-injection-tutorial-for-ios-getting-started

import Foundation

final class DIContainer: DIContainerProtocol {
    
    static let instance = DIContainer()
    
    private init() { }
    
    var components: [String: Any] = [:]
    
    func register<Component>(type: Component.Type, component: Any) {
        components["\(type)"] = component
    }
    
    func resolve<Component>(type: Component.Type) -> Component? {
        return components["\(type)"] as? Component
    }
}
