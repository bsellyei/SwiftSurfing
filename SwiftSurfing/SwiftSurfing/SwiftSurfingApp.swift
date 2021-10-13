//
//  SwiftSurfingApp.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 02. 24..
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        let container = DIContainer.instance
        
        container.register(
            type: CouchServiceProtocol.self,
            component: CouchService())
        
        container.register(
            type: ImageManagerProtocol.self,
            component: ImageManager())
        
        container.register(
            type: UserServiceProtocol.self,
            component: UserService())
        
        container.register(
            type: ReservationServiceProtocol.self,
            component: ReservationService())
        
        container.register(
            type: ConversationServiceProtocol.self,
            component: ConversationService())
        
        container.register(
            type: MessageServiceProtocol.self,
            component: MessageService())
        
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
}
