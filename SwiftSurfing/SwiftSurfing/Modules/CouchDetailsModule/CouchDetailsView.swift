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
    @State var toolbarLinkSelected = false
    
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
                        Image(systemName: "person.fill")
                    }
                    
                    Spacer()
                    
                    Label {
                        Text("\(presenter.couch.maxGuests)")
                    } icon: {
                        Image(systemName: "person.3.fill")
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
        .blur(radius: presenter.showOverlay ? 6 : 0)
        .overlay(
            ZStack {
                if presenter.showOverlay {
                    Color.black.opacity(0.25)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                presenter.showOverlay.toggle()
                            }
                        }
                    MultiDatePicker(dateRange: $presenter.selectedDates)
                } else {
                    EmptyView()
                }
            }
        )
        .navigationTitle("Couch Details")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                    withAnimation {
                        presenter.showOverlay.toggle()
                    }
                }) {
                    Image(systemName: "calendar")
                }
            }
            
            ToolbarItemGroup(placement: .bottomBar) {
                Text(presenter.selectedDatesText)
                
                Spacer()
                
                Button(action: {
                    toolbarLinkSelected = true
                }) {
                    ButtonContent(text: "Reserve")
                }
                .disabled(presenter.disableReserve)
            }
        }
        .background(
            self.presenter.linkBuilder(content: {
                EmptyView()
            }, isActive: $toolbarLinkSelected)
            .hidden()
        )
    }
    
    var imagesView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(presenter.couch.imageURLs, id: \.self) { imageUrl in
                    WebImage(url: URL(string: imageUrl))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 170, height: 170)
                        .clipped()
                }
            }
        }
    }
}

struct CouchDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = CouchDetailsInteractor()
        let presenter = CouchDetailsPresenter(interactor: interactor, couch: Couch())
        return CouchDetailsView(presenter: presenter)
    }
}
