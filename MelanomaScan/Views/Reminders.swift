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
    
    @State var selectedTimeIntervalKey = "Every week"
    @State var selectedTimeIntervalValue = 7
    let reminderTimeIntervalDictionary =   ["1. Once": -1,
                                            "2. Every week": 7,
                                            "3. Every two weeks": 14,
                                            "4. Every month": 30,
                                            "5. Every two months": 60,
                                            "6. Every three months": 90,
                                            "7. Every seven months": 180]
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                //pickers so that the user can decide how often and for how long reminders appear.
                
                Text("Choose Reminder Frequency -")
                    .font(.title2)
                    .bold()
                
                Picker(selection: $selectedTimeIntervalKey, label: Text("Reminder Interval")) {
                    ForEach(reminderTimeIntervalDictionary.sorted(by: <), id: \.key) { key, val in
                        Text(key)
                    }
                }
                
                
                
                Button("Create reminder") {
                    //method goes here to use what user inputted.
                    remindersManager.userCreateAndSaveNewReminder(calendarTitle: "MelanomaScan Reminder", calendarNotes: "Reminder to check any moles on your skin that you are unsure about.", timeInterval: reminderTimeIntervalDictionary[selectedTimeIntervalKey] ?? -1)
                }.buttonStyle(NeumorphicButtonStyle(color: Color("Background")))
                    .padding()
                
                
                Button("Show reminders") {
                    remindersManager.openRemindersApp()
                }.buttonStyle(NeumorphicButtonStyle(color: Color("Background")))
                    .padding()
                
            }
            .navigationBarTitle("Reminders")
        }
    }
}

struct Reminders_Previews: PreviewProvider {
    static var previews: some View {
        Reminders()
    }
}
