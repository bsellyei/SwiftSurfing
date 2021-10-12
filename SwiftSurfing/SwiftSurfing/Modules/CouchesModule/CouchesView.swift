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
                    self.presenter.linkBuilderForNewCouch(content: {
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
                    self.presenter.linkBuilderForCouchDetails(couch: item, content: {
                        CouchListRow(couch: item)
                    })
                }
                .listStyle(PlainListStyle())
                .onAppear(perform: presenter.getCouches)
            }
            .background(Color.white)
            .navigationBarHidden(true)
        }
    }
}

struct CouchesView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = CouchesInteractor(couchService: CouchService())
        let presenter = CouchesPresenter(interactor: interactor)
        return CouchesView(presenter: presenter)
    }
}
