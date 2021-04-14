//
//  HomeTabView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 13..
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
            MapView(presenter: MapPresenter(interactor: MapInteractor(couchService: DIContainer.instance.resolve(type: CouchServiceProtocol.self)!)))
            .tabItem {
                VStack {
                    Image(systemName: "house.fill")
                    Text("Trips")
                }
            }
            
            CouchesView(presenter: CouchesPresenter(
                            interactor: CouchesInteractor(couchService: DIContainer.instance.resolve(type: CouchServiceProtocol.self)!)))
            .tabItem {
                VStack {
                    Image(systemName: "house.fill")
                    Text("Couches")
                }
            }
            
            EmptyView()
            .tabItem {
                VStack {
                    Image(systemName: "gear")
                    Text("Profile")
                }
            }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
