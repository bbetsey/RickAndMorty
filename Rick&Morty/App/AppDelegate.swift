//
//  AppDelegate.swift
//  Rick&Morty
//
//  Created by Антон Тропин on 14.05.23.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = UINavigationController(rootViewController: StartViewController())
		window?.makeKeyAndVisible()
		
		return true
	}
	
}
