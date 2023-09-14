//
//  SwiftUINotificationsAppApp.swift
//  SwiftUINotificationsApp
//
//  Created by ipeerless on 14/09/2023.
//
import UserNotifications
import SwiftUI

@main
struct SwiftUINotificationsAppApp: App {
    init() { 
        
        @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                print("granted")
            } else  {
                print("error")
            }
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            UNUserNotificationCenter.current().delegate = self
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
                if let error = error {
                    print("\(error)")
                } else {
                    print("successfull")
                }
            }
            application.registerForRemoteNotifications()
            return true
        }
        func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            
            withCompletionHandler([.banner, .badge, .sound])
        }
        func userNotificationCenterResponse(_center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHndler: @escaping () -> Void) {
            completionHndler()
        }
        func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
            let token = deviceToken.map {_ in String(format: "%02.2hhx") }.joined()
            print("\(token)")
                
            
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
