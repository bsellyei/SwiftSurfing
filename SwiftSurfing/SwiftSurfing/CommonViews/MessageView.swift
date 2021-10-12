//
//  MessageView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 12..
//

import Foundation
import SwiftUI

struct MessageView: View {
    private let message: Message
    
    init(message: Message) {
        self.message = message
    }
    
    var background: some View {
        if message.isSentByCurrentUser {
            return Color.blue.opacity(0.25)
        } else {
            return Color.gray.opacity(0.25)
        }
    }
    
    var title: some View {
            if message.isSentByCurrentUser {
                return Text("")
            } else {
                return Text(message.senderId)
                        .font(.footnote)
            }
    }
    
    var body: some View {
        HStack {
            if message.isSentByCurrentUser {
                Spacer()
            }
            
            VStack(alignment: .leading) {
                Text(message.message)
                .padding(8)
                .background(background)
                .cornerRadius(24)
            }
            
            if !message.isSentByCurrentUser {
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
    }
}
