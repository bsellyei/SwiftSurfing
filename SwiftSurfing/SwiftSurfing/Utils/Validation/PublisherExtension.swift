//
//  PublisherExtension.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 12..
//
// source: https://github.com/jnewc/SwiftUI-Validation

import Foundation
import Combine

extension Published.Publisher where Value == String {
    func nonEmptyValidator(_ errorMessage: @autoclosure @escaping ValidationErrorClosure) -> ValidationPublisher {
        return ValidationPublishers.nonEmptyValidation(for: self, errorMessage: errorMessage())
    }
}
