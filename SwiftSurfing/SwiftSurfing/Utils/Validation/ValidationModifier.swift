//
//  ValidationModifier.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 12..
//
// source: https://github.com/jnewc/SwiftUI-Validation

import Foundation
import SwiftUI

struct ValidationModifier: ViewModifier {
    @State var latestValidation: Validation = .success
    
    let validationPublisher: ValidationPublisher
    
    func body(content: Content) -> some View {
        return VStack(alignment: .leading) {
            content
            validationMessage
        }.onReceive(validationPublisher) { validation in
            self.latestValidation = validation
        }
    }
    
    var validationMessage: some View {
        switch latestValidation {
        case .success:
            return AnyView(EmptyView())
        case .failure(let message):
            let text = Text(message)
                .foregroundColor(Color.red)
                .font(.caption)
            return AnyView(text)
        }
    }
}

extension View {
    func validation(_ validationPublisher: ValidationPublisher) -> some View {
        self.modifier(ValidationModifier(validationPublisher: validationPublisher))
    }
}
