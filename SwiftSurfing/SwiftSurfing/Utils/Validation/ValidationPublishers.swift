//
//  ValidationPublishers.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 12..
//
// source: https://github.com/jnewc/SwiftUI-Validation

import Foundation
import Combine

typealias ValidationErrorClosure = () -> String
typealias ValidationPublisher = AnyPublisher<Validation, Never>

class ValidationPublishers {
    static func nonEmptyValidation(for publisher: Published<String>.Publisher,
                                   errorMessage: @autoclosure @escaping ValidationErrorClosure) -> ValidationPublisher {
        return publisher.map { value in
            guard value.count > 0 else {
                return .failure(message: errorMessage())
            }
            return .success
        }
        .dropFirst()
        .eraseToAnyPublisher()
    }
    
    
}
