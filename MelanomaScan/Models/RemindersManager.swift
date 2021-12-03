//
//  RemindersManager.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 02/12/21.
//

import Foundation
import EventKit
import UIKit

class RemindersManager {
    
    let store = EKEventStore()
    
    //asks for permission for reminders
    func askForPermission(grantedAction: @escaping () -> Void) {
        store.requestAccess(to: .reminder) { (granted, error) in
            if let error = error {
                print(error)
                return
            }
            if granted {
                grantedAction()
            }
        }
    }
    
    func requestRemindersAccess() {
        
        store.requestAccess(to: .reminder, completion:
                                {(granted: Bool, error: Error?) -> Void in
            if granted {
                //self.insertEvent(store: store)
                print("Access granted")
            } else {
                print("Access denied")
            }
        })
    }
    
    // function to create a new reminder (pass in title, description and how long after today the reminder should be set for
    func createAndSaveNewReminder(calendarTitle: String, calendarNotes: String, timeInterval: Double) {
        guard let calendar = self.store.defaultCalendarForNewReminders() else {
            print("Default calendar not created")
            return
        }
        
        print("working here")
        print(calendar)
        
        let newReminder = EKReminder(eventStore: store)
        newReminder.calendar = calendar
        newReminder.title = calendarTitle
        
        newReminder.priority = Int(EKReminderPriority.high.rawValue)
        newReminder.notes = calendarNotes
        
        let dueDate = Date().addingTimeInterval(timeInterval)
        newReminder.dueDateComponents = Calendar.current.dateComponents([.year, .month, .day], from: dueDate)
        
        do {
            print("place1")
            try self.store.save(newReminder, commit: true)
            print("place2")
        } catch let error {
            print("place3")
            print(error)
        }
        
    }
    
    func openRemindersApp() {
        if let url = URL(string: "x-apple-reminderkit://MelanomaScan"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:]) { (isDone) in
                
            }
        }
    }
    
}

