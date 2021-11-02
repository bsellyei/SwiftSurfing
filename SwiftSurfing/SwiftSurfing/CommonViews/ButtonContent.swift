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
    var width: CGFloat
    var height: CGFloat
    
    init(text: String, width: CGFloat = 220, height: CGFloat = 40) {
        self.text = text
        self.width = width
        self.height = height
    }
    
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: width, height: height)
            .background(Color.blue)
            .cornerRadius(15.0)
    }
}
