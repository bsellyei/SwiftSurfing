//
//  CouchesView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 16..
//

import SwiftUI

struct CouchesView: View {
    @ObservedObject var presenter: CouchesPresenter
    
    init(presenter: CouchesPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    self.presenter.linkBuilder(content: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .clipped()
                            .frame(width: 50, height: 50)
                    })
                    
                    Text("Add new Couch")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                    
                    Spacer()
                }
                .padding()
                
                List(presenter.couches) { item in
                    CouchRow(couch: item)
                }
                .onAppear(perform: presenter.getCouches)
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct CouchRow: View {
    var couch: Couch
    
    var body: some View {
        Text(couch.name)
    }
}

struct CouchesView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = CouchesInteractor(couchService: CouchService())
        let presenter = CouchesPresenter(interactor: interactor)
        return CouchesView(presenter: presenter)
    }
}
