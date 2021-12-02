//
//  Reminders.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 14/10/21.
//

import SwiftUI
import UserNotifications

struct Reminders: View {
    
    let remindersManager = RemindersManager()
    
    var body: some View {
        
        VStack {
            Button("Ask for access to calendars") {
                remindersManager.requestRemindersAccess()
            }
            Button("Create a reminder") {
                remindersManager.createAndSaveNewReminder(calendarTitle: "TEST REMINDER", calendarNotes: "This is a test reminder", timeInterval: Double(60 * 60 * 24 * 3) )
            }
        }
        .navigationBarTitle("Reminders", displayMode: .inline)
    }
}

struct Reminders_Previews: PreviewProvider {
    static var previews: some View {
        Reminders()
    }
}
