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
    @State private var showSheet = false
    
    var selectedImage: Binding<UIImage> {
        Binding<UIImage> { () -> UIImage in
            return presenter.addedImages.last ?? UIImage()
        } set: { (newImage) in
            presenter.addedImages.insert(newImage, at: 0)
        }
    }
    
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
                    .disableAutocorrection(true)
                
                TextField("Address", text: $presenter.address)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .disableAutocorrection(true)
                
                TextField("City", text: $presenter.city)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .disableAutocorrection(true)
                
                TextField("Country", text: $presenter.country)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .disableAutocorrection(true)
                
                Stepper("Max. number of guests: \(presenter.maxGuests)", value: $presenter.maxGuests)
                
                TextEditor(text: $presenter.description)
                    .padding()
                    .background(lightGreyColor)
                    .frame(width: 350, height: 150)
                    .cornerRadius(5.0)
                    .disableAutocorrection(true)
                
                HStack(spacing: 12) {
                    imageView
                }
                .sheet(isPresented: $showSheet) {
                    ImagePickerKit(selectedImage: selectedImage)
                }
                
                TextField("Tags", text: $presenter.tags)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .disableAutocorrection(true)
                
                Spacer()
            }
            .padding()
            .alert(isPresented: $presenter.showAlert) {
                Alert(title: Text("Adding couch failed."), message: Text("Please try again."), dismissButton: .default(Text("Try again")))
            }
        }
        .navigationTitle("New Couch")
        .toolbar(content: {
            Button("Save") {
                self.presenter.addNewCouch()
                self.presentationMode.wrappedValue.dismiss()
            }
        })
    }
    
    var imageView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                VStack {
                    Button(action: {
                        showSheet = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .clipped()
                    }
                }
                .frame(width: 170, height: 170)
                .background(Color(.secondarySystemBackground))
                
                ForEach(presenter.addedImages, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 170, height: 170)
                        .clipped()
                }
            }
        }
        .padding()
    }
}

struct NewCouchView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = NewCouchInteractor(couchService: CouchService(), imageManager: ImageManager())
        let presenter = NewCouchPresenter(interactor: interactor)
        return NavigationView {
            NewCouchView(presenter: presenter)
        }
    }
}
