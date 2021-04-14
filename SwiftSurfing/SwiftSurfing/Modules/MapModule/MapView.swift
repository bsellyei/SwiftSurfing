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
        GeometryReader { geometry in
            ZStack {
                MapViewKit(region: presenter.region, annotations: presenter.annotations)
            }
            
            SheetView(isOpen: $sheetOpen, maxHeight: geometry.size.height * 0.5) {
            }
            
            VStack {
                /*SearchBarKit(text: presenter.searchText, searchOperation: {
                    self.presenter.search()
                })
                    .padding(.top, -30)*/
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = MapInteractor(couchService: CouchService())
        let presenter = MapPresenter(interactor: interactor)
        return MapView(presenter: presenter)
    }
}
