# SSEventFlow

[![Version](https://img.shields.io/cocoapods/v/SSEventFlow.svg?style=flat)](http://cocoapods.org/pods/SSEventFlow)
[![License](https://img.shields.io/cocoapods/l/SSEventFlow.svg?style=flat)](http://cocoapods.org/pods/SSEventFlow)
[![Platform](https://img.shields.io/cocoapods/p/SSEventFlow.svg?style=flat)](http://cocoapods.org/pods/SSEventFlow)

SSEventFlow is a type safe alternative to NSNotification, inspired by Flux.

The Flux Application Architecture was recently invented by Facebook.
[See video to how it works](https://facebook.github.io/flux/docs/in-depth-overview.html#content)


## Usage

Open the SSEventFlow.xcodeproj file and run the Example project.


## Requirements

- iOS 10.0+ / macOS 10.12+
- Xcode 8.3+
- Swift 3.0+


## Installation

SSEventFlow is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SSEventFlow"
```


## Example of how to send out notifications

```swift
class ParentViewController: UIViewController {
	@IBAction func redButtonAction(_ sender: AnyObject) {
		PickedColorEvent(color: UIColor.red, name: "RED").fire()
	}
	@IBAction func greenButtonAction(_ sender: AnyObject) {
		PickedColorEvent(color: UIColor.green, name: "GREEN").fire()
	}
	@IBAction func blueButtonAction(_ sender: AnyObject) {
		PickedColorEvent(color: UIColor.blue, name: "BLUE").fire()
	}
	@IBAction func resetButtonAction(_ sender: AnyObject) {
		ResetEvent().fire()
	}
}
```


## Example of how to listen for notifications

```swift
class ChildViewController: UIViewController, FlowDispatcher {
	@IBOutlet weak var colorName: UILabel!
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		flow_start()
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		flow_stop()
		super.viewDidDisappear(animated)
	}
	
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
```


## Author

Simon Strandgaard, neoneye@gmail.com


## License

SSEventFlow is available under the MIT license. See the LICENSE file for more info.
