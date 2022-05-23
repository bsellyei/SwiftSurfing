//
//  SmartDevicesView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2022. 05. 23..
//

import SwiftUI

struct SmartDevicesView: View {
    @ObservedObject var presenter: SmartDevicesPresenter
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            ForEach($presenter.devices, id: \.self) { item in
                HStack {
                    Text(item.couchAddress.wrappedValue)
                        .font(.title2)
                    
                    Spacer()
                }
                .padding()
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(item.devices, id: \.self) { device in
                        CardView(data: device.wrappedValue, onToggle: { id in presenter.switchItem(id: id) })
                    }
                }
                .padding(.horizontal)
            }
        }
        .onAppear(perform: presenter.getData)
        .navigationBarHidden(true)
    }
}

struct CardView: View {
    var data: SmartDevice
    let onToggle: (String) -> Void
    
    @State var isOn = false
    
    init(data: SmartDevice, onToggle: @escaping (String) -> Void) {
        self.data = data
        self.onToggle = onToggle
        isOn = data.state
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(data.type)
                .font(.system(size: 22, weight: .semibold)).lineLimit(2)
            HStack {
                if isOn {
                   Text("On")
                } else {
                    Text("Off")
                }
                Spacer()
                Toggle("", isOn: $isOn)
                    .onChange(of: isOn) { _ in
                        onToggle(data.id)
                    }
            }
        }
        .frame(width: 120)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(self.isOn ? Color.green : Color.gray, lineWidth: 2)
        )
    }
}
