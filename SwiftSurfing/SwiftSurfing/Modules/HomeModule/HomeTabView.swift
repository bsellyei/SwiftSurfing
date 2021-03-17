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
            MapView(presenter: MapPresenter(interactor: MapInteractor()))
            .tabItem {
                VStack {
                    Image(systemName: "house.fill")
                    Text("Trips")
                }
            }
            
            CouchesView(presenter: CouchesPresenter(interactor: CouchesInteractor()))
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
