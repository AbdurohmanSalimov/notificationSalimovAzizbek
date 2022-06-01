//
//  AppDelegate.swift
//  notificationSalimovAzizbek
//
//  Created by Azizbek Salimov on 01.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Request user permission
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in

            // If granted comes true you can enabled features based on authorization.
            guard granted else { return }

            application.registerForRemoteNotifications()
        }
        
            self.window = UIWindow()
        let vc = HomeVC()
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
        
        
        return true
    }
    
    //MARK: Getting device token
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print(token)
    }

    //MARK: In case of error
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {

        print("i am not available in simulator :( \(error)")
    }
 
    


}

