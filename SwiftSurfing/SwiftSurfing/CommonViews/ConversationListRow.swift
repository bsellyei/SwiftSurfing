//
//  ConversationListRow.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 12..
//

import SwiftUI

struct ConversationListRow: View {
    private let userName: String
    private let message: Message
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    init(userName: String, message: Message) {
        self.userName = userName
        self.message = message
    }
    
    var body: some View {
        HStack {
            Image(systemName: "nosign")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 75, height: 75, alignment: .leading)
                .clipped()
            
            VStack(alignment: .leading) {
                Text("\(userName)")
                    .font(.title2)
                    .bold()
                    .lineLimit(1)
                Text("\(message.message)")
                    .font(.title3)
                    .lineLimit(1)
                Text("\(message.sendTime, formatter: Self.dateFormatter)")
                    .font(.body)
                    .padding(.bottom, 3)
            }
        }
    }
}
