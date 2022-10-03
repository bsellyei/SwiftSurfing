//
//  NewSmartDeviceView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2022. 09. 23..
//

import SwiftUI

struct NewSmartDeviceView: View {
    @ObservedObject var presenter: NewSmartDevicePresenter
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init(presenter: NewSmartDevicePresenter) {
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
                    
                HStack {
                    Text("Couch: ")
                        
                    Picker("Couches", selection: $presenter.selectedCouchAddress) {
                        ForEach(presenter.couchAddresses, id: \.self) {
                            Text($0)
                        }
                    }
                }
                    
                HStack {
                    Text("Device type: ")
                        
                    Picker("Device type", selection: $presenter.selectedDeviceType) {
                        ForEach(presenter.deviceTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    .onChange(of: presenter.selectedDeviceType, perform: { _ in
                        presenter.getDeviceTypeProperties()
                    })
                }
                    
                    
                ForEach($presenter.switchesList) { $item in
                    Toggle("\(item.label)", isOn: $item.isOn)
                }
                    
                ForEach($presenter.valuesList) { $item in
                    Stepper("\(item.label): \(item.value)", value: $item.value, in: 0...30)
                }
                    
                Spacer()
            }
            .padding()
            .onAppear(perform: presenter.loadData)
            .alert(isPresented: $presenter.showAlert) {
                Alert(title: Text("Adding smart device failed."), message: Text("Please try again."), dismissButton: .default(Text("Try again")))
            }
        }
        .navigationTitle("New Device")
        .toolbar(content: {
            Button("Save") {
                self.presenter.addNewDevice()
                self.presentationMode.wrappedValue.dismiss()
            }
        })
    }
}
