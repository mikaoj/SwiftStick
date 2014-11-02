#Description
8-directional virtual joystick [ADD_IMAGE]
#Usage
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