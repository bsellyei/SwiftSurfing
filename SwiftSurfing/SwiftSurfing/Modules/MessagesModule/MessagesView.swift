//
//  MessagesView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 12..
//

import Foundation
import SwiftUI

struct MessagesView: View {
    @ObservedObject var presenter: MessagesPresenter
    
    init(presenter: MessagesPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        VStack {
            List(presenter.messages) { item in
                MessageView(message: item)
                    .scaleEffect(x: 1, y: -1, anchor: .center)
            }
            .scaleEffect(x: 1, y: -1, anchor: .center)
            .offset(x: 0, y: 2)
            
            HStack {
                TextField("Type a message...", text: $presenter.text)
                Button(action: presenter.sendMessage) {
                    Text("Send")
                }
            }
            .padding()
        }
        .navigationBarTitle("Name")
        .onAppear(perform: presenter.getMessages)
    }
}
