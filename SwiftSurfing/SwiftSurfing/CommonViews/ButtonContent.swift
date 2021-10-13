//
//  ButtonContent.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 13..
//

import Foundation
import SwiftUI

struct ButtonContent: View {
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 220, height: 40)
            .background(Color.blue)
            .cornerRadius(15.0)
    }
}
