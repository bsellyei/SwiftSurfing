//
//  NewCouchView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 16..
//

import SwiftUI

struct NewCouchView: View {
    @ObservedObject var presenter: NewCouchPresenter
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init(presenter: NewCouchPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Name", text: $presenter.name)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                
                TextField("Address", text: $presenter.address)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                
                TextField("City", text: $presenter.city)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                
                TextField("Country", text: $presenter.country)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                
                Stepper("Max. number of guests: \(presenter.maxGuests)", value: $presenter.maxGuests)
                
                TextEditor(text: $presenter.description)
                    .padding()
                    .background(lightGreyColor)
                    .frame(width: 350, height: 150)
                    .cornerRadius(5.0)
                
                TextField("Tags", text: $presenter.tags)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("New Couch")
        .toolbar(content: {
            Button("Save") {
                self.presenter.addNewCouch()
                self.presentationMode.wrappedValue.dismiss()
            }
        })
    }
}

struct NewCouchView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = NewCouchInteractor(couchService: CouchService())
        let presenter = NewCouchPresenter(interactor: interactor)
        return NavigationView {
            NewCouchView(presenter: presenter)
        }
    }
}
