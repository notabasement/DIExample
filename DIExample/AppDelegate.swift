//
//  AppDelegate.swift
//  DIExample
//
//  Created by Vy Le on 4/15/21.
//

import UIKit
import Swinject
import SwinjectAutoregistration
import DIExamplePresenter

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    lazy var container: Container = {
        RegistrationManager.setupContainers()
        RegistrationManager.setupAssemblies()
        if let closure = RegistrationManager.containers[.main] {
            return Container(registeringClosure: closure)
        } else {
            return Container()
        }
    }()
    lazy var appAssembler = Assembler(container: container)
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}
