//
//  ContentView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 02. 24..
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        RootView(presenter:
            RootPresenter(interactor:
                RootInteractor()))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
