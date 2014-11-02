// The MIT License (MIT)
//
// Copyright (c) 2014 Joakim Gyllström
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

func +(left: CGPoint, right: CGPoint) -> CGPoint {
    var sum = CGPointZero
    
    sum.x = left.x + right.x
    sum.y = left.y + right.y
    
    return sum
}

func -(left: CGPoint, right: CGPoint) -> CGPoint {
    var sum = CGPointZero
    
    sum.x = left.x - right.x
    sum.y = left.y - right.y
    
    return sum
}

enum SwiftStickDirection: Printable {
    case None, Up, UpLeft, UpRight, Left, Right, DownLeft, DownRight, Down
    
    // Point should be in the range -1,-1 to 1,1
    init(point: CGPoint) {
        //Handle center exception
        if point == CGPointZero {
            self = .None
            return
        }
        
        //Calculate degrees
        var degrees = atan2(Double(point.y), Double(point.x)) * (180 / M_PI)
        //No negative values
        if degrees < 0 {
            degrees = degrees + 360
        }
        
        if SwiftStickDirection.angle(degrees, inDirection: .Up) {
            self = .Up
        } else if SwiftStickDirection.angle(degrees, inDirection: .UpRight) {
            self = .UpRight
        } else if SwiftStickDirection.angle(degrees, inDirection: .Right) {
            self = .Right
        } else if SwiftStickDirection.angle(degrees, inDirection: .DownRight) {
            self = .DownRight
        } else if SwiftStickDirection.angle(degrees, inDirection: .Down) {
            self = .Down
        } else if SwiftStickDirection.angle(degrees, inDirection: .DownLeft) {
            self = .DownLeft
        } else if SwiftStickDirection.angle(degrees, inDirection: .Left) {
            self = .Left
        } else if SwiftStickDirection.angle(degrees, inDirection: .UpLeft) {
            self = .UpLeft
        } else {
            self = .None
        }
    }
    
    static func angle(angle: Double, inDirection direction: SwiftStickDirection) -> Bool {
        switch direction {
        case .Right:
            let maxAngle = direction.baseLine + 22.5
            let minAngle = 360.0 - 22.5
            
            return angle <= maxAngle || angle >= minAngle
        default:
            let maxAngle = direction.baseLine + 22.5
            let minAngle = direction.baseLine - 22.5
            
            return angle <= maxAngle && angle >= minAngle
        }
    }
    
    var baseLine: Double {
        switch self {
        case .None:
            return 999.0
        case .Up:
            return 90.0
        case UpLeft:
            return 135.0
        case UpRight:
            return 45.0
        case Left:
            return 180.0
        case Right:
            return 0.0
        case DownLeft:
            return 225.0
        case DownRight:
            return 315.0
        case Down:
            return 270.0
        }
    }
    
    var description: String {
        get {
            switch self {
            case .None:
                return "None"
            case .Up:
                return "Up"
            case UpLeft:
                return "UpLeft"
            case UpRight:
                return "UpRight"
            case Left:
                return "Left"
            case Right:
                return "Right"
            case DownLeft:
                return "DownLeft"
            case DownRight:
                return "DownRight"
            case Down:
                return "Down"
            }
        }
    }
}

protocol SwiftStickViewDelegate: class {
    func swiftStickView(swiftStickView: SwiftStickView, didChangeToDirection toDirection: SwiftStickDirection, fromDirection: SwiftStickDirection)
}

@IBDesignable class SwiftStickView: UIView {
    weak var delegate: SwiftStickViewDelegate?
    
    private var stickDirection: SwiftStickDirection = .None {
        didSet {
            if self.stickDirection != oldValue {
                self.delegate?.swiftStickView(self, didChangeToDirection: self.stickDirection, fromDirection: oldValue)
            }
        }
    }
    
    private lazy var baseView: StickBaseView = {
        var view = StickBaseView(frame: self.bounds)
        view.backgroundColor = UIColor.clearColor()
        view.autoresizingMask = .FlexibleHeight | .FlexibleWidth
        
        return view
    }()
    
    private lazy var stickView: StickView = {
        var view = StickView(frame: self.bounds)
        view.backgroundColor = UIColor.clearColor()
        view.autoresizingMask = .FlexibleHeight | .FlexibleWidth
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(baseView)
        addSubview(stickView)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubview(baseView)
        addSubview(stickView)
    }
    
    // MARK: - Touch
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        handleTouch(touches)
    }
    
    override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.resetStick()
        })
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.resetStick()
        })
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        handleTouch(touches)
    }
    
    private func handleTouch(touches: NSSet) {
        if let touch = touches.anyObject() as? UITouch {
            let location = touch.locationInView(self)
            var target = location
            var direction = CGPointZero
            
            direction.x = location.x - baseView.center.x
            direction.y = location.y - baseView.center.y
            let len = sqrt(direction.x * direction.x + direction.y * direction.y)
            
            //TODO: Remove magic 5 and explain why
            if len < 20.0 {
                direction = CGPointZero
            } else {
                let len_inv = (1.0/len)
                direction.x *= len_inv
                direction.y *= len_inv
                direction.y *= -1
            }
            
            moveStick(target)
            stickDirection = SwiftStickDirection(point: direction)
        }
    }
    
    private func moveStick(var position: CGPoint) {
        let normalizedPosition = position - baseView.center
        let len = Double(sqrt(pow(normalizedPosition.x, 2) + pow(normalizedPosition.y, 2)))
        
        let radius = 60.0;
        if len > radius {
            let angle = atan2(Double(normalizedPosition.y), Double(normalizedPosition.x))
            
            let x = cos(angle) * radius + Double(baseView.center.x);
            let Y = sin(angle) * radius + Double(baseView.center.y);
            
            position.x = CGFloat(x)
            position.y = CGFloat(Y)
        }
        
        stickView.center = position
    }
    
    private func resetStick() {
        self.stickView.center = self.baseView.center
        self.stickDirection = SwiftStickDirection(point: CGPointZero)
    }
}
