//
//  NewSmartDevicePresenter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2022. 09. 23..
//

import Foundation

class NewSmartDevicePresenter: ObservableObject {
    private var interactor: NewSmartDeviceInteractor
    
    @Published var name: String
    
    @Published var couchAddresses: [String]
    @Published var selectedCouchAddress: String
    private var couchAddressesToIds: [String:String]
    
    @Published var deviceTypes: [String]
    @Published var selectedDeviceType: String
    
    private var channels: [Channel]
    @Published var switchesList: [SwitchItem]
    @Published var valuesList: [NumberItem]
    
    @Published var showAlert: Bool
    
    init(interactor: NewSmartDeviceInteractor) {
        self.interactor = interactor
        
        self.name = ""
        
        self.couchAddresses = []
        self.selectedCouchAddress = ""
        self.couchAddressesToIds = [:]
        
        self.deviceTypes = []
        self.selectedDeviceType = ""
        
        self.channels = []
        self.switchesList = []
        self.valuesList = []
        
        self.showAlert = false
    }
    
    func loadData() {
        getDeviceTypes()
        getCouchNames()
    }
    
    private func getCouchNames() {
        couchAddressesToIds = interactor.getCouchAddressesToIds()
        
        for (address, _) in couchAddressesToIds {
            couchAddresses.append(address)
        }
        
        selectedCouchAddress = couchAddresses[0]
    }
    
    private func getDeviceTypes() {
        DispatchQueue.global(qos: .background).async {
            self.interactor.getDeviceTypes(completion: { deviceTypes in
                self.deviceTypes = deviceTypes
                
                self.selectedDeviceType = self.deviceTypes[0]
            })
        }
    }
    
    func getDeviceTypeProperties() {
        DispatchQueue.global(qos: .background).async {
            self.interactor.getDeviceTypeProperties(completion: { channels in
                for channel in channels {
                    if channel.type == "Switch" {
                        self.switchesList.append(SwitchItem(id: channel.id, label: channel.label))
                    } else if channel.type == "Number:Temperature" {
                        self.valuesList.append(NumberItem(id: channel.id, label: channel.label))
                    }
                }
            })
        }
    }
    
    func addNewDevice() {
        if let couchId = couchAddressesToIds[selectedCouchAddress] {
            let device = Device(couchId: couchId, name: name, type: selectedDeviceType, items: switchesList + valuesList)
            DispatchQueue.global(qos: .background).async {
                self.interactor.addNewDevice(device: device, completion: { success in
                    self.showAlert = !success
                })
            }
        }
    }
}

class Channel: Identifiable {
    var id: String
    var type: String
    var label: String
    
    init(id: String, type: String, label: String) {
        self.id = id
        self.type = type
        self.label = label
    }
}

class SwitchItem: Channel {
    var isOn: Bool
    
    init(id: String, label: String, isOn: Bool = false) {
        self.isOn = isOn
        
        super.init(id: id, type: "Switch", label: label)
    }
}

class NumberItem: Channel {
    var value: Int
    
    init(id: String, label: String, value: Int = 20) {
        self.value = value
        
        super.init(id: id, type: "Number:Temperature", label: label)
    }
}
