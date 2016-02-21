# SSEventFlow

[![Version](https://img.shields.io/cocoapods/v/SSEventFlow.svg?style=flat)](http://cocoapods.org/pods/SSEventFlow)
[![License](https://img.shields.io/cocoapods/l/SSEventFlow.svg?style=flat)](http://cocoapods.org/pods/SSEventFlow)
[![Platform](https://img.shields.io/cocoapods/p/SSEventFlow.svg?style=flat)](http://cocoapods.org/pods/SSEventFlow)

SSEventFlow is a type safe alternative to NSNotification, inspired by Flux.

The Flux Application Architecture was recently invented by Facebook.
[See video to how it works](https://facebook.github.io/flux/docs/overview.html)


## Usage

Open the SSEventFlow.xcodeproj file and run the Example project.


## Requirements

This framework is for iOS 8 and for OSX 10.10


## Installation

SSEventFlow is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SSEventFlow"
```


## Example of how to send out notifications

```swift
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
```


## Example of how to listen for notifications

```swift
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
```


## Author

Simon Strandgaard, neoneye@gmail.com


## License

SSEventFlow is available under the MIT license. See the LICENSE file for more info.
