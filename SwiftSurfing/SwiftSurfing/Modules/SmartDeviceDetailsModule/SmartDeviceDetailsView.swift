//
//  SmartDeviceDetailsView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2022. 10. 04..
//

import SwiftUI

struct SmartDeviceDetailsView: View {
    @ObservedObject var presenter: SmartDeviceDetailsPresenter
    
    init(presenter: SmartDeviceDetailsPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Couch:")
                    Spacer()
                    Text("\(presenter.couchAddress)")
                }
                
                HStack {
                    Text("Device type:")
                    Spacer()
                    Text("\(presenter.deviceType)")
                }
                
                ForEach($presenter.switchesList) { $item in
                    Toggle("\(item.label)", isOn: $item.isOn)
                        .onChange(of: item.isOn, perform: { _ in
                            self.presenter.onSwitchChanged(switchItem: item)
                        })
                }
                    
                ForEach($presenter.valuesList) { $item in
                    Stepper("\(item.label): \(item.value)", value: $item.value, in: 0...30)
                        .onChange(of: item.value, perform: { _ in
                            self.presenter.onValueChanged(numberItem: item)
                        })
                }
            }
            .padding()
            .onAppear(perform: presenter.loadData)
        }
        .navigationTitle("Device Details")
    }
}
