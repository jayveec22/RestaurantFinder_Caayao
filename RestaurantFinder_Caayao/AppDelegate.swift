//
//  AppDelegate.swift
//  RestaurantFinder_Caayao
//
//  Created by Jayvee Caayao on 09.10.19.
//  Copyright © 2019 Jayvee Caayao. All rights reserved.
//

import UIKit
import Pilgrim

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?

    // MARK: - Subviews
    private let firstNavigation: UINavigationController = {
        let navigation: UINavigationController = UINavigationController()
        navigation.navigationBar.isTranslucent = false
        navigation.navigationBar.barTintColor = UIColor.red
        return navigation
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow()
        self.window!.rootViewController = self.firstNavigation

        self.coordinator = AppCoordinator(navigationController: self.firstNavigation)
        self.coordinator?.start()
        self.window?.makeKeyAndVisible()

        PilgrimManager.shared().configure(withConsumerKey: "XKPFUBVA1Y5QIQ1BJYIL15UPOJ4ILCW31X4RC4IMOZOABOJP", secret: "RFJPLN0ST25ZJZB5DFD5HYWFGBSX2RD1W1GNAKRWEG1ZIFJT", delegate: self, completion: nil)
        PilgrimManager.shared().start()
        print(PilgrimManager.shared().oauthToken)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension AppDelegate : PilgrimManagerDelegate {
    // Primary visit handler:
    func pilgrimManager(_ pilgrimManager: PilgrimManager, handle visit: Visit) {
        // Process the visit however you'd like:
        print("\(visit.hasDeparted ? "Departure from" : "Arrival at") \(visit.venue != nil ? visit.venue!.name : "Unknown venue."). Added a Pilgrim visit at: \(visit.displayName)")
    }

    // Optional: If visit occurred without network connectivity
    func pilgrimManager(_ pilgrimManager: PilgrimManager, handleBackfill visit: Pilgrim.Visit) {
        // Process the visit however you'd like:
        print("Backfill \(visit.hasDeparted ? "departure from" : "arrival at") \(visit.venue != nil ? visit.venue!.name : "Unknown venue."). Added a Pilgrim backfill visit at: \(visit.displayName)")
    }

    // Optional: If visit occurred by triggering a geofence
    func pilgrimManager(_ pilgrimManager: PilgrimManager, handle geofenceEvents: [GeofenceEvent]) {
        // Process the geofence events however you'd like. Here we loop through the potentially multiple geofence events and handle them individually:
        geofenceEvents.forEach { geofenceEvent in
            print(geofenceEvent)
        }
    }
}

