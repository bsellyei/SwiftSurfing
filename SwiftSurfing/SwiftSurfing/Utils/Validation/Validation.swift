//
//  Validation.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 12..
//
// source: https://github.com/jnewc/SwiftUI-Validation

import Foundation

enum Validation {
    case success
    case failure(message: String)
    
    var isSuccess: Bool {
        if case .success = self {
            return true
        }
        return false
    }
}
