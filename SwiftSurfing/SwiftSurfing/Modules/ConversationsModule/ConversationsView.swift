//
//  ConversationView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 12..
//

import Foundation
import SwiftUI

struct ConversationsView: View {
    @ObservedObject var presenter: ConversationsPresenter
    
    var body: some View {
        NavigationView {
            List(presenter.conversations) { item in
                self.presenter.linkBuilderForMessages(conversation: item, content: {
                    ConversationListRow(conversation: item, message: self.presenter.lastMessages[item.id] ?? Message())
                })
            }
            .navigationTitle("Messages")
            .listStyle(PlainListStyle())
            .onAppear(perform: presenter.getConversations)
        }
    }
}
