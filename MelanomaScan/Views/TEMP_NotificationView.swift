//
//  TEMP_NotificationView.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 02/12/21.
//

import SwiftUI
import UserNotifications

struct TEMP_NotificationView: View {
    
    @ObservedObject var notificationManager = LocalNotificationManager()
    
    @State var showFootnote = false
    
    var body: some View {
        
        VStack {
            Button(action: {
                withAnimation {
                    self.showFootnote.toggle()
                    //9. Use the send notification function
                    //print("location1")
                    self.notificationManager.sendNotification(title: "Hurray!", subtitle: nil, body: "If you see this text, launching the local notification worked!", launchIn: 5)
                }
            }) {
                Text("Launch Local Notification 🚀")
                    .font(.title)
            }
            if showFootnote {
                Text("Notification Arrives in 5 seconds")
                    .font(.footnote)
            }
        }
        .navigationBarTitle("Reminders", displayMode: .inline)
    }
}


struct TEMP_NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        TEMP_NotificationView()
    }
}
