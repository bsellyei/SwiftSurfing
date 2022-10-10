//
//  SmartDeviceDetailsPresenter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2022. 10. 07..
//

import Foundation
import SwiftUI

class SmartDeviceDetailsPresenter: ObservableObject {
    private var interactor: SmartDeviceDetailsInteractor
    
    let deviceId: String
    @Published var device: HomeConfiguration
    
    @Published var couchAddress: String
    @Published var deviceType: String
    
    @Published var switchesList: [SwitchItem]
    @Published var valuesList: [NumberItem]
    
    init(interactor: SmartDeviceDetailsInteractor, deviceId: String) {
        self.interactor = interactor
        
        self.deviceId = deviceId
        self.device = HomeConfiguration(_id: nil, couch: nil, name: nil, type: nil, itemNames: nil, state: nil)
        
        self.couchAddress = ""
        self.deviceType = ""
        
        self.switchesList = []
        self.valuesList = []
    }
    
    func loadData() {
        DispatchQueue.global(qos: .background).async {
            self.interactor.getSmartDevice(id: self.deviceId, completion: { device in
                self.device = device
                if let type = self.device.type {
                    self.deviceType = type.rawValue
                }
                
                self.getRelatedCouchAddress()
                self.loadRelatedItems()
            })
        }
    }
    
    func onSwitchChanged(switchItem: SwitchItem) {
        DispatchQueue.global(qos: .background).async {
            var item = APIItem(name: switchItem.id.stringValue, type: switchItem.type, label: switchItem.label, state: "")
            item.state = switchItem.isOn ? "on" : "off"
            
            self.interactor.updatePropertyState(item: item, completion: { result in
                if let itemName = item.name {
                    print(itemName + result.description)
                }
            })
        }
    }
    
    func onValueChanged(numberItem: NumberItem) {
        DispatchQueue.global(qos: .background).async {
            var item = APIItem(name: numberItem.id.stringValue, type: numberItem.type, label: numberItem.label, state: "")
            item.state = String(intValue: numberItem.value)
            
            self.interactor.updatePropertyState(item: item, completion: { result in
                if let itemName = item.name {
                    print(itemName + result.description)
                }
            })
        }
    }
    
    private func getRelatedCouchAddress() {
        DispatchQueue.global(qos: .background).async {
            if let couch = self.device.couch {
                if let couchId = couch._id {
                    self.interactor.getCouchAddress(couchId: couchId, completion: { address in
                        self.couchAddress = address
                    })
                }
            }
        }
    }
    
    private func loadRelatedItems() {
        DispatchQueue.global(qos: .background).async {
            if let deviceId = self.device._id {
                self.interactor.getItems(id: deviceId, completion: { items in
                    for item in items {
                        if item.type == "Switch" {
                            self.addSwitch(item: item)
                        } else if item.type == "Number:Temperature" {
                            self.addValueItem(item: item)
                        }
                    }
                })
            }
        }
    }
    
    private func addSwitch(item: APIItem) {
        if let name = item.name, let label = item.label, let state = item.state {
            let on = state == "ON"
            switchesList.append(SwitchItem(id: name, label: label, isOn: on))
        }
    }
    
    private func addValueItem(item: APIItem) {
        if let name = item.name, let label = item.label, let state = item.state {
            if let value = Int(state) {
                valuesList.append(NumberItem(id: name, label: label, value: value))
            } else {
                valuesList.append(NumberItem(id: name, label: label, value: 20))
            }
        }
    }
}
