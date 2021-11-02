//
//  NotificationManager.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 22..
//

import Foundation
import UserNotifications

class NotificationManager: NotificationManagerProtocol {
    
    func scheduleNotification(date: Date) {
        requestAuthorization()
        
        let content = UNMutableNotificationContent()
        content.title = "Reservation reminder"
        content.subtitle = "You have a reservation for today!"
        content.sound = UNNotificationSound.default
        
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: date),
            repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    private func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
