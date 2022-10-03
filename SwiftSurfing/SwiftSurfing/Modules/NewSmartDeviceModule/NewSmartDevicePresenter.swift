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
    
    //private var channels: [Channel]
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
        
        self.switchesList = []
        self.valuesList = []
        
        self.showAlert = false
    }
    
    func loadData() {
        getDeviceTypes()
        getCouchNames()
    }
    
    private func getCouchNames() {
        interactor.getCouchAddressesToIds(completion: { couchAddressesToIds in
            self.couchAddressesToIds = couchAddressesToIds
            
            for (address, _) in self.couchAddressesToIds {
                self.couchAddresses.append(address)
            }
            
            self.selectedCouchAddress = self.couchAddresses[0]
        })
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
        switchesList.removeAll()
        valuesList.removeAll()
        DispatchQueue.global(qos: .background).async {
            self.interactor.getDeviceTypeProperties(completion: { channels in
                for channel in channels {
                    if channel.itemType == "Switch" {
                        if let channelLabel = channel.label, let channelId = channel._id {
                            self.switchesList.append(SwitchItem(id: channelId, label: channelLabel))
                        }
                        
                    } else if channel.itemType == "Number:Temperature" {
                        if let channelLabel = channel.label, let channelId = channel._id {
                            self.valuesList.append(NumberItem(id: channelId, label: channelLabel))
                        }
                    }
                }
            })
        }
    }
    
    func addNewDevice() {
        if let couchId = couchAddressesToIds[selectedCouchAddress] {
            let data = CreateHomeConfigurationData(couchId: couchId, name: name, type: selectedDeviceType, items: convertItems())
            DispatchQueue.global(qos: .background).async {
                self.interactor.addNewDevice(createHomeConfigData: data, completion: { success in
                    self.showAlert = !success
                })
            }
        }
    }
    
    private func convertItems() -> [APIItem] {
        var result: [APIItem] = []
        for item in switchesList {
            var state = ""
            if item.isOn {
                state = "on"
            } else {
                state = "off"
            }
            
            result.append(APIItem(name: item.id, type: item.type, label: item.label, state: state))
        }
        
        for item in valuesList {
            if let value = String(intValue: item.value) {
                result.append(APIItem(name: item.id, type: item.type, label: item.label, state: value))
            }
        }
        
        return result
    }
}

class Item: Identifiable {
    var id: String
    var type: String
    var label: String
    
    init(id: String, type: String, label: String) {
        self.id = id
        self.type = type
        self.label = label
    }
}

class SwitchItem: Item {
    var isOn: Bool
    
    init(id: String, label: String, isOn: Bool = false) {
        self.isOn = isOn
        
        super.init(id: id, type: "Switch", label: label)
    }
}

class NumberItem: Item {
    var value: Int
    
    init(id: String, label: String, value: Int = 20) {
        self.value = value
        
        super.init(id: id, type: "Number:Temperature", label: label)
    }
}
