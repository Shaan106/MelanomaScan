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
    var accessGranted = false
    
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
                self.accessGranted = true
            } else {
                print("Access denied")
            }
        })
    }
    
    // function to create a new reminder (pass in title, description and how long after today the reminder should be set for
    func createAndSaveNewReminder(calendarTitle: String, calendarNotes: String, timeInterval: Double, numWeeksPerRepeat: Int) {
        
        if self.accessGranted == false {
            
            self.requestRemindersAccess()
            
        }
        
        guard let calendar = self.store.defaultCalendarForNewReminders() else {
            print("Default calendar not created")
            return
        }
        
        //print("working here")
        //print(calendar)
        
        let newReminder = EKReminder(eventStore: store)
        newReminder.calendar = calendar
        newReminder.title = calendarTitle
        
        newReminder.priority = Int(EKReminderPriority.high.rawValue)
        newReminder.notes = calendarNotes
        
        let dueDate = Date().addingTimeInterval(timeInterval)
        newReminder.dueDateComponents = Calendar.current.dateComponents([.year, .month, .day], from: dueDate)
        
        if numWeeksPerRepeat == -1 {
            
            do {
                try self.store.save(newReminder, commit: true)
                print("** Reminder Saved **")
            } catch let error {
                print(error)
            }
            
        } else {
            
            let recurrenceRule = EKRecurrenceRule(recurrenceWith: .weekly, interval: numWeeksPerRepeat, daysOfTheWeek: [EKRecurrenceDayOfWeek(.monday)], daysOfTheMonth: nil, monthsOfTheYear: nil, weeksOfTheYear: nil, daysOfTheYear: nil, setPositions: nil, end: nil)
            newReminder.addRecurrenceRule(recurrenceRule)
            
            do {
                try self.store.save(newReminder, commit: true)
                print("** Reminder Saved **")
            } catch let error {
                print(error)
            }
            
        }
        
        
    }
    
    func openRemindersApp() {
        if let url = URL(string: "x-apple-reminderkit://MelanomaScan"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:]) { (isDone) in
            }
        }
    }
    
    // creates a reminder using the user's inputs.
    func userCreateAndSaveNewReminder(calendarTitle: String, calendarNotes: String, timeInterval: Int) {
        //deal with special case of "once"
        if timeInterval == -1 {
            self.createAndSaveNewReminder(calendarTitle: calendarTitle, calendarNotes: calendarNotes, timeInterval: Double(60 * 60 * 24 * timeInterval), numWeeksPerRepeat: -1)
        } else {
            
            //convert from repeat (for how many days), to value for how many weeks.
            var numWeeksPerReminder: Int = 0
            numWeeksPerReminder = timeInterval/7
            print("**************")
            print(numWeeksPerReminder)
            print("**************")
            
            self.createAndSaveNewReminder(calendarTitle: calendarTitle, calendarNotes: calendarNotes, timeInterval: Double(60 * 60 * 24 * timeInterval), numWeeksPerRepeat: numWeeksPerReminder)
            
        }
        
        
    }
    
}

