//
//  AppDelegate.swift
//  SSEventFlow_Example
//
//  Created by Simon Strandgaard on 02/20/2016.
//  Copyright (c) 2016 Simon Strandgaard. All rights reserved.
//

import UIKit
import SSEventFlow

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, FlowDispatcher {
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		flow_start()
        return true
    }
	
	func flow_dispatch(event: FlowEvent) {
		print("AppDelegate.flow_dispatch()\n  \(event)\n")
	}
}

