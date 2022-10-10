//
//  SmartDevicesView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2022. 05. 23..
//

import SwiftUI

struct SmartDevicesView: View {
    @ObservedObject var presenter: SmartDevicesPresenter
    
    init(presenter: SmartDevicesPresenter) {
        self.presenter = presenter
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            ForEach($presenter.devices) { item in
                HStack {
                    Text(item.couchAddress.wrappedValue)
                        .font(.title2)
                    
                    Spacer()
                    
                    self.presenter.linkBuilderForNewDevice(content: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .clipped()
                            .frame(width: 25, height: 25)
                    })
                }
                .padding()
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(item.devices) { data in
                        CardView(data: data.wrappedValue,
                                 buttonView: {
                            self.presenter.linkBuilderForDetails(id: data.wrappedValue.name, content: {
                                        Image(systemName: "arrowshape.turn.up.right")
                                            .resizable()
                                            .clipped()
                                            .frame(width: 20, height: 20)
                                    })
                                 },
                                 onToggle: { id in self.presenter.switchItem(id: id) })
                    }
                }
                .padding(.horizontal)
            }
        }
        .onAppear(perform: presenter.getData)
        .navigationBarHidden(true)
    }
}

struct CardView<Content: View>: View {
    var data: SmartDevice
    let onToggle: (String) -> Void
    let buttonView: () -> Content
    
    @State var isOn: Bool
    
    init(data: SmartDevice, @ViewBuilder buttonView: @escaping () -> Content, onToggle: @escaping (String) -> Void) {
        self.data = data
        self.onToggle = onToggle
        self.buttonView = buttonView
        
        self.isOn = data.state
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(data.type)
                    .font(.system(size: 22, weight: .semibold)).lineLimit(2)
                
                Spacer()
                
                buttonView()
            }
            
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
