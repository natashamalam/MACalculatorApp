//
//  AppDelegate.swift
//  MACalculatorApp
//
//  Created by Alam, Mahjabin | Natasha | ECMPD on 2023/02/28.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = CalculatorViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

