//
//  SmartDevicesPresenter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2022. 05. 23..
//

import Foundation
import CloudKit

class SmartDevicesPresenter: ObservableObject {
    private var interactor: SmartDevicesInteractor
    
    @Published var devices: [CouchWithSmartDevicesData] = []
    
    init(interactor: SmartDevicesInteractor) {
        self.interactor = interactor
    }
    
    func getData() {
        DispatchQueue.global(qos: .background).async {
            self.interactor.getCouches(completion: { couches in
                for couch in couches {
                    self.interactor.getDevices(couchId: couch.id, completion: { devices in
                        var smartDevices: [SmartDevice] = []
                        for device in devices {
                            smartDevices.append(SmartDevice(
                                id: device._id!,
                                type: self.convertType(type: device.type!),
                                state: self.convertState(state: device.state!)))
                        }
                        
                        self.devices.append(CouchWithSmartDevicesData(couchAddress: couch.address, devices: smartDevices))
                    })
                }
            })
        }
    }
    
    func switchItem(id: String) {
        DispatchQueue.global(qos: .background).async {
            self.interactor.switchItem(id: id, completion: { _ in })
        }
    }
    
    private func convertType(type: ConfigurationType) -> String {
        switch type {
            case .heating: return "Heating"
            case .cooling: return "Cooling"
            case .weatherwatcher: return "WeatherWatcher"
        }
    }
    
    private func convertState(state: ItemState) -> Bool {
        switch state {
            case .on: return true
            case .off: return false
        }
    }
}

struct CouchWithSmartDevicesData: Hashable {
    var couchAddress: String
    var devices: [SmartDevice]
}

struct SmartDevice: Hashable {
    var id: String
    var type: String
    var state: Bool
}
