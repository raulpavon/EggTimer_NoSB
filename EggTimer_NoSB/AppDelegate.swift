//
//  AppDelegate.swift
//  EggTimer_NoSB
//
//  Created by Raúl Pavón on 31/01/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var eggTimerCoordinator: EggTimerCoordinator?
    let navController = UINavigationController()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initializeWindow()
        return true
    }
    
    func initializeWindow() {
        eggTimerCoordinator = EggTimerCoordinator(navigationController: navController)
        eggTimerCoordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}

