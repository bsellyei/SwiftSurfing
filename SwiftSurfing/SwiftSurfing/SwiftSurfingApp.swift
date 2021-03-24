//
//  SwiftSurfingApp.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 02. 24..
//

import SwiftUI
import Firebase

@main
struct SwiftSurfingApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FirebaseApp.configure()
            
            let container = DIContainer.instance
            
            container.register(
                type: CouchServiceProtocol.self,
                component: CouchService())
            
            return true
        }
    }
}
