//
//  ContentView.swift
//  SwiftUINotificationsApp
//
//  Created by ipeerless on 14/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("schedule local notifications" ) {
                scheduleLocalNotification()
            }
        }
    }
    func scheduleLocalNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "notes"
        content.body = "notesBody"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("\(error)")
            } else {
                print("successfully")
            }
        }
    }
}

#Preview {
    ContentView()
}
