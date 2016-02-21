//
//  ViewControllers.swift
//  SSEventFlow_Example
//
//  Created by Simon Strandgaard on 02/20/2016.
//  Copyright (c) 2016 Simon Strandgaard. All rights reserved.
//

import UIKit
import SSEventFlow

struct PickedColorEvent: FlowEvent {
	let color: UIColor
	let name: String
	init(color: UIColor, name: String) {
		self.color = color
		self.name = name
	}
}


struct ResetEvent: FlowEvent {}


class ParentViewController: UIViewController {
	@IBAction func redButtonAction(sender: AnyObject) {
		PickedColorEvent(color: UIColor.redColor(), name: "RED").fire()
	}
	@IBAction func greenButtonAction(sender: AnyObject) {
		PickedColorEvent(color: UIColor.greenColor(), name: "GREEN").fire()
	}
	@IBAction func blueButtonAction(sender: AnyObject) {
		PickedColorEvent(color: UIColor.blueColor(), name: "BLUE").fire()
	}
	@IBAction func resetButtonAction(sender: AnyObject) {
		ResetEvent().fire()
	}
}


class ChildViewController: UIViewController, FlowDispatcher {
	@IBOutlet weak var colorName: UILabel!
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		flow_start()
	}
	
	override func viewDidDisappear(animated: Bool) {
		flow_stop()
		super.viewDidDisappear(animated)
	}
	
	func flow_dispatch(event: FlowEvent) {
		if let e = event as? PickedColorEvent {
			view.backgroundColor = e.color
			colorName.text = e.name
		}
		if event is ResetEvent {
			view.backgroundColor = nil
			colorName.text = ""
		}
	}
}

