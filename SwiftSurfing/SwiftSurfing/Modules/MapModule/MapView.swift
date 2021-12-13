//
//  MapView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 13..
//

import SwiftUI

struct MapView: View {
    @ObservedObject var presenter: MapPresenter
    @State var sheetOpen = false
    
    init(presenter: MapPresenter) {
        self.presenter = presenter
    }
        
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    MapViewKit(region: presenter.region, annotations: presenter.annotations)
                }
                
                VStack {
                    SearchBarKit(searchOperation: { searchText in
                        presenter.search(searchText: searchText)
                    })
                    .frame(width: geometry.size.width, height: 40)
                }
                .padding(.top, 25)
                
                SheetView(isOpen: $sheetOpen, maxHeight: geometry.size.height * 0.5) {
                    List(presenter.couches) { item in
                        self.presenter.linkBuilderForCouchDetails(couch: item, content: {
                            CouchListRow(couch: item, userName: presenter.userNames[item.id] ?? "")
                        })
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .onAppear(perform: presenter.getCouches)
            .navigationTitle("Map View")
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = MapInteractor(couchService: CouchService(), userService: UserService())
        let presenter = MapPresenter(interactor: interactor)
        return MapView(presenter: presenter)
    }
}
