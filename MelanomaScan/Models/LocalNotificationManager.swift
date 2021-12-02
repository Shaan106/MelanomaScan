//
//  LocalNotificationManager.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 30/11/21.
//

import Foundation
import SwiftUI

//class to handle local notifications
class LocalNotificationManager: ObservableObject {
    
    var notifications = [Notification]()
    
    //asking for permission to send notifications from user.
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted == true && error == nil {
                print("Notifications permitted")
            } else {
                print("Notifications not permitted")
            }
        }
    }
    
    //method to send the actual notification.
    func sendNotification(title: String, subtitle: String?, body: String, launchIn: Double) {
        
        let content = UNMutableNotificationContent()
        content.title = title
        if let subtitle = subtitle {
            content.subtitle = subtitle
        }
        content.body = body
        
//        let imageName = "testImg"
//        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else {
//            print("location2")
//            return
//        }
//        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
//
//        content.attachments = [attachment]
        
        //sending the actual notification
        print("working here")
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: launchIn, repeats: false)
        let request = UNNotificationRequest(identifier: "demoNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
}
