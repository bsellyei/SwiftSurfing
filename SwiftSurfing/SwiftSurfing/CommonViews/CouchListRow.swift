//
//  CouchListRow.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 04. 15..
//

import SwiftUI
import SDWebImageSwiftUI

struct CouchListRow: View {
    @State var couch: Couch
    @State var userName: String
    
    init(couch: Couch, userName: String) {
        self.couch = couch
        self.userName = userName
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            /*Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 20, height: 20, alignment: .topTrailing)*/
            
            HStack {
                if couch.imageURLs.first == "placeholder" {
                    Image(systemName: "nosign")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100, alignment: .leading)
                        .clipped()
                } else {
                    WebImage(url: URL(string: couch.imageURLs.first ?? ""))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100, alignment: .leading)
                        .clipped()
                }
                
                VStack(alignment: .leading) {
                    Text("\(couch.city), \(couch.country)")
                        .font(.title2)
                        .padding(.bottom, 5)
                    Text("\(userName)")
                        .font(.title3)
                        .padding(.bottom, 3)
                    RatingView(rating: $couch.ratingAverage, numberOfRatings: couch.ratingCount, isEditable: false)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(7.0)
        .border(Color.black, width: 1)
        .cornerRadius(5.0)
    }
}

struct CouchListRow_Previews: PreviewProvider {
    static var previews: some View {
        CouchListRow(couch: Couch(), userName: "")
    }
}