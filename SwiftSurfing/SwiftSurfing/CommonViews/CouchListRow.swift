//
//  CouchListRow.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 04. 15..
//

import SwiftUI
import SDWebImageSwiftUI

struct CouchListRow: View {
    private var couch: Couch
    @State var rating: Int = Int.random(in: 1...5)
    
    init(couch: Couch) {
        self.couch = couch
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            /*Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 20, height: 20, alignment: .topTrailing)*/
            
            HStack {
                /*Image("placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100, alignment: .leading)
                    .clipped()*/
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
                    Text("Home owner's name")
                        .font(.title3)
                        .padding(.bottom, 3)
                    RatingView(rating: $rating, numberOfRatings: Int.random(in: 1...100))
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
        CouchListRow(couch: Couch())
    }
}
