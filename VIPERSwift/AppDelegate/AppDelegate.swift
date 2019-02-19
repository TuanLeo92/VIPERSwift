//
//  AppDelegate.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let animalsView = AnimalListView(nibName: "AnimalListView", bundle: nil)
        let rootNavi = UINavigationController(rootViewController: animalsView)
        
        window?.rootViewController = rootNavi
        window?.makeKeyAndVisible()
        
        return true
    }
}

