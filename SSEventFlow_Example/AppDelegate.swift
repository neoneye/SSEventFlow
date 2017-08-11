// MIT license. Copyright (c) 2017 Simon Strandgaard. All rights reserved.
import UIKit
import SSEventFlow

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		flow_start()
        return true
    }
}

extension AppDelegate: FlowDispatcher {
	func flow_dispatch(_ event: FlowEvent) {
		print("AppDelegate.flow_dispatch()\n  \(event)\n")
	}
}
