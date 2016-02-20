//  Copyright © 2015 Simon Strandgaard. All rights reserved.
public protocol FlowEvent {}

extension FlowEvent {
	/// Send event to all installed dispatchers
	public func fire() { FlowManager.sharedInstance.dispatch(self) }
}


public protocol FlowDispatcher: class {
	func flow_dispatch(event: FlowEvent)
}

extension FlowDispatcher {
	/// Start listening for events. Does nothing if already started.
	public func flow_start() { FlowManager.sharedInstance.install(self) }

	/// Stop listening for events. Does nothing if already stopped.
	public func flow_stop() { FlowManager.sharedInstance.uninstall(self) }
}


internal class FlowManager {
	static var sharedInstance = FlowManager()

	struct Box {
		weak var dispatcher: FlowDispatcher?
	}
	var boxes = [Box]()
	
	func dispatch(event: FlowEvent) {
		purge()
		for box in boxes { box.dispatcher?.flow_dispatch(event) }
	}

	func purge() {
		boxes = boxes.filter { $0.dispatcher != nil }
	}
	
	func reset() {
		boxes = []
	}
	
	func install(dispatcher: FlowDispatcher) {
		uninstall(dispatcher)
		boxes.append(Box(dispatcher: dispatcher))
	}
	
	func uninstall(dispatcher: FlowDispatcher) {
		boxes = boxes.filter { $0.dispatcher !== dispatcher }
		purge()
	}
}
