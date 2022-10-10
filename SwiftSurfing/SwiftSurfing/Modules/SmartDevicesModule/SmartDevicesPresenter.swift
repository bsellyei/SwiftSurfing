//
//  SmartDevicesPresenter.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2022. 05. 23..
//

import Foundation
import SwiftUI
import Combine

class SmartDevicesPresenter: ObservableObject {
    private var interactor: SmartDevicesInteractor
    private let router = SmartDevicesRouter()
    
    @Published var devices: [CouchWithSmartDevicesData] = []
    
    init(interactor: SmartDevicesInteractor) {
        self.interactor = interactor
    }
    
    func getData() {
        self.devices = []
        DispatchQueue.global(qos: .background).async {
            self.interactor.getCouches(completion: { couches in
                for couch in couches {
                    self.interactor.getDevices(couchId: couch.id, completion: { devices in
                        var smartDevices: [SmartDevice] = []
                        for device in devices {
                            smartDevices.append(SmartDevice(
                                id: device._id!,
                                name: device._id!,
                                type: self.convertType(type: device.type!),
                                state: self.convertState(state: device.state!)))
                        }
                        
                        self.devices.append(CouchWithSmartDevicesData(id: couch.id, couchAddress: couch.address, devices: smartDevices))
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
    
    func linkBuilderForNewDevice<Content: View>(@ViewBuilder content: () -> Content)
        -> some View
    {
        NavigationLink(destination: router.makeNewDeviceView()) {
            content()
        }
    }
    
    func linkBuilderForDetails<Content: View>(id: String, @ViewBuilder content: () -> Content)
        -> some View
    {
        NavigationLink(destination: router.makeDetailsView(homeConfigurationId: id)) {
            content()
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

struct CouchWithSmartDevicesData: Identifiable {
    var id: String
    
    var couchAddress: String
    var devices: [SmartDevice]
}

struct SmartDevice: Identifiable {
    var id: String
    var name: String
    var type: String
    var state: Bool
}
