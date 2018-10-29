// MIT license. Copyright (c) 2018 Simon Strandgaard. All rights reserved.
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
	@IBAction func redButtonAction(_ sender: Any) {
		PickedColorEvent(color: UIColor.red, name: "RED").fire()
	}
	@IBAction func greenButtonAction(_ sender: Any) {
		PickedColorEvent(color: UIColor.green, name: "GREEN").fire()
	}
	@IBAction func blueButtonAction(_ sender: Any) {
		PickedColorEvent(color: UIColor.blue, name: "BLUE").fire()
	}
	@IBAction func resetButtonAction(_ sender: Any) {
		ResetEvent().fire()
	}
}

class ChildViewController: UIViewController {
	@IBOutlet weak var colorName: UILabel!

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		flow_start()
	}

	override func viewDidDisappear(_ animated: Bool) {
		flow_stop()
		super.viewDidDisappear(animated)
	}
}

extension ChildViewController: FlowDispatcher {
	func flow_dispatch(_ event: FlowEvent) {
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
