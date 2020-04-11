// MIT license. Copyright (c) 2020 Simon Strandgaard. All rights reserved.
import XCTest
@testable import SSEventFlow

class MyDispatcher: FlowDispatcher {
	let closure: () -> Void

	init(closure: @escaping () -> Void) {
		self.closure = closure
	}

	func flow_dispatch(_ event: FlowEvent) {
		closure()
	}
}

class MyIncrementAction: FlowEvent {
	// do nothing
}

class SSEventFlowTests: XCTestCase {
	var dispatcher: MyDispatcher?
	var count: Int = 0

	override func setUp() {
		super.setUp()
		FlowManager.shared.reset()
		count = 0
		dispatcher = MyDispatcher { [weak self] in
			self?.count += 1
		}
		dispatcher?.flow_start()
	}

	override func tearDown() {
		dispatcher?.flow_stop()
		dispatcher = nil
		super.tearDown()
	}

	func testDispatchSuccess() {
		XCTAssertEqual(0, count)
		MyIncrementAction().fire()
		XCTAssertEqual(1, count)
	}

	func testUninstallWhenNilled() {
		XCTAssertEqual(0, count)
		dispatcher = nil
		MyIncrementAction().fire()
		XCTAssertEqual(0, count)
	}

	func testStop() {
		XCTAssertEqual(0, count)
		dispatcher?.flow_stop()
		MyIncrementAction().fire()
		XCTAssertEqual(0, count)
	}
}
