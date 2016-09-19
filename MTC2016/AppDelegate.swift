//
//  AppDelegate.swift
//  MTC2016
//
//  Created by Jonas Stubenrauch on 29.02.16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var router: Router!
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
    router = Router()
    window = UIWindow()
    window?.rootViewController = UINavigationController(rootViewController: router.rootViewController)
    window?.makeKeyAndVisible()
    return true
  }

}


