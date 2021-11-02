//
//  RatingsView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 26..
//

import Foundation
import SwiftUI

struct RatingsView: View {
    @ObservedObject var presenter: RatingsPresenter
    
    var body: some View {
        VStack {
            RatingSummaryView(ctx: $presenter.summary)
            
            Divider()
                .background(Color.black)
            
            VStack {
                RatingView(rating: $presenter.ratingCreationValue, numberOfRatings: 0, isEditable: true)
                
                TextField("Review", text: $presenter.ratingCreationComment)
                    .autocapitalization(.none)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 5)
                
                Button(action: {
                    presenter.sendRating()
                }) {
                    ButtonContent(text: "Rate!", width: 100, height: 30)
                }
            }
            .padding(.horizontal)
            
            Divider()
                .background(Color.black)
            
            List(presenter.ratings) { item in
                VStack {
                    HStack {
                        Label("Name", systemImage: "person.fill")
                        
                        Spacer()
                        
                        Text("\(item.value)")
                        Image(systemName: "star.fill")
                    }
                    
                    HStack {
                        Text("\(item.comment)")
                        
                        Spacer()
                    }
                }
            }
        }
        .onAppear(perform: presenter.getRatings)
    }
}

struct RatingsView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = RatingsInteractor(ratingsService: RatingService(), couchService: CouchService())
        let presenter = RatingsPresenter(interactor: interactor, couchId: "")
        return RatingsView(presenter: presenter)
    }
}
