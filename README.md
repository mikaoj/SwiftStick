#Description
![SwiftStickDemo](https://cloud.githubusercontent.com/assets/4034956/4874648/3d545e24-6267-11e4-890d-ded52022a580.gif "SwiftStickDemo")
8 direction virtual joystick for iOS
#Usage
##Install
TODO: Add installation instructions

###Use
Setup view and add the stickview in your view controller
```swift
let stickView = SwiftStickView(frame: CGRectMake(50, 50, 250, 250))
stickView.delegate = self
view.addSubview(stickView)
```
Implement delegate method
```swift
// MARK: SwiftStickViewDelegate
func swiftStickView(swiftStickView: SwiftStickView, didChangeToDirection toDirection: SwiftStickDirection, fromDirection: SwiftStickDirection) {
    //Do something with direction
}
```
#Contribute
Help wanted! I'm a programmer, not a designer. So the graphics would sure need a lot of work :)
#License
MIT License (see LICENSE file)
