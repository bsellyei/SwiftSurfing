//
//  CouchDetailsView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 05. 05..
//

import SwiftUI
import SDWebImageSwiftUI
import MapKit

struct CouchDetailsView: View {
    @ObservedObject var presenter: CouchDetailsPresenter
    
    init(presenter: CouchDetailsPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(spacing: 12) {
                    imagesView
                }
                
                HStack {
                    Text("\(presenter.couch.city), \(presenter.couch.country)")
                        .font(.title)
                    
                    Spacer()
                }
                
                // Tags here
                
                HStack {
                    Label {
                        Text("User's name")
                    } icon: {
                        Image(systemName: "keyboard")
                    }
                    
                    Spacer()
                    
                    Label {
                        Text("\(presenter.couch.maxGuests)")
                    } icon: {
                        Image(systemName: "person.fill")
                    }
                }
                
                // Ratings here
                
                Text("\(presenter.couch.description)")
                
                Map(coordinateRegion: $presenter.region, interactionModes: MapInteractionModes.zoom, annotationItems: [presenter.couch])
                { annotation in
                    MapMarker(coordinate: CLLocationCoordinate2D(latitude: annotation.latitude, longitude: annotation.longitude))
                }
                .frame(width: 300, height: 300)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Couch Details")
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Text("Selected dates")
                
                Spacer()
                
                Button(action: {
                    print("reserve")
                }) {
                    ButtonContent(text: "Reserve")
                }
                .disabled(presenter.disableReserve)
            }
            
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                    print("Calendar tapped")
                }) {
                    Image(systemName: "calendar")
                }
            }
        }
    }
    
    var imagesView: some View {
        /*ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(presenter.images, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 170, height: 170)
                        .clipped()
                }
            }
        }
        .padding()*/
        WebImage(url: URL(string: presenter.couch.imageURLs.first ?? ""))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 170, height: 170)
            .clipped()
    }
}

struct CouchDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = CouchDetailsInteractor()
        let presenter = CouchDetailsPresenter(interactor: interactor, couch: Couch())
        return CouchDetailsView(presenter: presenter)
    }
}
