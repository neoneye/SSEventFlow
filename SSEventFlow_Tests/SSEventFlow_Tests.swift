//
//  SSEventFlow_Tests.swift
//  SSEventFlow_Tests
//
//  Created by Simon Strandgaard on 21-02-16.
//  Copyright (c) 2016 Simon Strandgaard. All rights reserved.
//

import XCTest
@testable import SSEventFlow

class MyDispatcher: FlowDispatcher {
	let closure: Void -> Void
	
	init(closure: Void -> Void) {
		self.closure = closure
	}
	
	func flow_dispatch(event: FlowEvent) {
		closure()
	}
}

class MyIncrementAction: FlowEvent {
	// do nothing
}


class SSEventFlow_Tests: XCTestCase {
	var dispatcher: MyDispatcher?
	var count: Int = 0
	
	override func setUp() {
		super.setUp()
		FlowManager.sharedInstance.reset()
		count = 0
		let dispatcher = MyDispatcher() { [weak self] in
			self?.count += 1
		}
		self.dispatcher = dispatcher
		dispatcher.flow_start()
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
		self.dispatcher = nil
		MyIncrementAction().fire()
		XCTAssertEqual(0, count)
	}
	
	func testStop() {
		XCTAssertEqual(0, count)
		self.dispatcher?.flow_stop()
		MyIncrementAction().fire()
		XCTAssertEqual(0, count)
	}
}
