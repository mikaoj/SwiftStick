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

@IBDesignable class StickBaseView: UIView {
    override func drawRect(rect: CGRect) {
        //When drawing in paintcode i uses a 500x500 frame.
        //Scale to match current frame
        CGContextScaleCTM(UIGraphicsGetCurrentContext(), rect.width/500.0, rect.height/500.0)
        drawBase(frame: rect)
    }
    
    //// PaintCode Trial Version
    //// www.paintcodeapp.com
    
    private func drawBase(#frame: CGRect) {
        //// Color Declarations
        let baseColor = UIColor(red: 0.500, green: 0.500, blue: 0.500, alpha: 1.000)
        
        //// StickBase Drawing
        var stickBasePath = UIBezierPath()
        stickBasePath.moveToPoint(CGPointMake(frame.minX + 250, frame.minY))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 282.8, frame.minY + 52.68), controlPoint1: CGPointMake(frame.minX + 250, frame.minY), controlPoint2: CGPointMake(frame.minX + 266.71, frame.minY + 26.83))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 366.32, frame.minY + 87.28), controlPoint1: CGPointMake(frame.minX + 313.58, frame.minY + 57.75), controlPoint2: CGPointMake(frame.minX + 341.98, frame.minY + 69.86))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 426.78, frame.minY + 73.22), controlPoint1: CGPointMake(frame.minX + 395.98, frame.minY + 80.38), controlPoint2: CGPointMake(frame.minX + 426.78, frame.minY + 73.22))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 412.72, frame.minY + 133.68), controlPoint1: CGPointMake(frame.minX + 426.78, frame.minY + 73.22), controlPoint2: CGPointMake(frame.minX + 419.61, frame.minY + 104.02))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 447.32, frame.minY + 217.2), controlPoint1: CGPointMake(frame.minX + 430.14, frame.minY + 158.02), controlPoint2: CGPointMake(frame.minX + 442.25, frame.minY + 186.42))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 500, frame.minY + 250), controlPoint1: CGPointMake(frame.minX + 473.17, frame.minY + 233.29), controlPoint2: CGPointMake(frame.minX + 500, frame.minY + 250))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 447.32, frame.minY + 282.8), controlPoint1: CGPointMake(frame.minX + 500, frame.minY + 250), controlPoint2: CGPointMake(frame.minX + 473.17, frame.minY + 266.71))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 412.72, frame.minY + 366.32), controlPoint1: CGPointMake(frame.minX + 442.25, frame.minY + 313.58), controlPoint2: CGPointMake(frame.minX + 430.14, frame.minY + 341.98))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 426.78, frame.minY + 426.78), controlPoint1: CGPointMake(frame.minX + 419.62, frame.minY + 395.98), controlPoint2: CGPointMake(frame.minX + 426.78, frame.minY + 426.78))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 366.32, frame.minY + 412.72), controlPoint1: CGPointMake(frame.minX + 426.78, frame.minY + 426.78), controlPoint2: CGPointMake(frame.minX + 395.98, frame.minY + 419.61))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 282.8, frame.minY + 447.32), controlPoint1: CGPointMake(frame.minX + 341.98, frame.minY + 430.14), controlPoint2: CGPointMake(frame.minX + 313.58, frame.minY + 442.25))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 250, frame.minY + 500), controlPoint1: CGPointMake(frame.minX + 266.71, frame.minY + 473.17), controlPoint2: CGPointMake(frame.minX + 250, frame.minY + 500))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 217.2, frame.minY + 447.32), controlPoint1: CGPointMake(frame.minX + 250, frame.minY + 500), controlPoint2: CGPointMake(frame.minX + 233.29, frame.minY + 473.17))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 133.68, frame.minY + 412.72), controlPoint1: CGPointMake(frame.minX + 186.42, frame.minY + 442.25), controlPoint2: CGPointMake(frame.minX + 158.02, frame.minY + 430.14))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 73.22, frame.minY + 426.78), controlPoint1: CGPointMake(frame.minX + 104.02, frame.minY + 419.62), controlPoint2: CGPointMake(frame.minX + 73.22, frame.minY + 426.78))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 87.28, frame.minY + 366.32), controlPoint1: CGPointMake(frame.minX + 73.22, frame.minY + 426.78), controlPoint2: CGPointMake(frame.minX + 80.39, frame.minY + 395.98))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 52.68, frame.minY + 282.8), controlPoint1: CGPointMake(frame.minX + 69.86, frame.minY + 341.98), controlPoint2: CGPointMake(frame.minX + 57.75, frame.minY + 313.58))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX, frame.minY + 250), controlPoint1: CGPointMake(frame.minX + 26.83, frame.minY + 266.71), controlPoint2: CGPointMake(frame.minX, frame.minY + 250))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 52.68, frame.minY + 217.2), controlPoint1: CGPointMake(frame.minX, frame.minY + 250), controlPoint2: CGPointMake(frame.minX + 26.83, frame.minY + 233.29))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 87.28, frame.minY + 133.68), controlPoint1: CGPointMake(frame.minX + 57.75, frame.minY + 186.42), controlPoint2: CGPointMake(frame.minX + 69.86, frame.minY + 158.02))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 73.22, frame.minY + 73.22), controlPoint1: CGPointMake(frame.minX + 80.38, frame.minY + 104.02), controlPoint2: CGPointMake(frame.minX + 73.22, frame.minY + 73.22))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 133.68, frame.minY + 87.28), controlPoint1: CGPointMake(frame.minX + 73.22, frame.minY + 73.22), controlPoint2: CGPointMake(frame.minX + 104.02, frame.minY + 80.39))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 217.2, frame.minY + 52.68), controlPoint1: CGPointMake(frame.minX + 158.02, frame.minY + 69.86), controlPoint2: CGPointMake(frame.minX + 186.42, frame.minY + 57.75))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 250, frame.minY), controlPoint1: CGPointMake(frame.minX + 233.29, frame.minY + 26.83), controlPoint2: CGPointMake(frame.minX + 250, frame.minY))
        stickBasePath.closePath()
        stickBasePath.moveToPoint(CGPointMake(frame.minX + 250, frame.minY + 100))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 100, frame.minY + 250), controlPoint1: CGPointMake(frame.minX + 167.16, frame.minY + 100), controlPoint2: CGPointMake(frame.minX + 100, frame.minY + 167.16))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 250, frame.minY + 400), controlPoint1: CGPointMake(frame.minX + 100, frame.minY + 332.84), controlPoint2: CGPointMake(frame.minX + 167.16, frame.minY + 400))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 400, frame.minY + 250), controlPoint1: CGPointMake(frame.minX + 332.84, frame.minY + 400), controlPoint2: CGPointMake(frame.minX + 400, frame.minY + 332.84))
        stickBasePath.addCurveToPoint(CGPointMake(frame.minX + 250, frame.minY + 100), controlPoint1: CGPointMake(frame.minX + 400, frame.minY + 167.16), controlPoint2: CGPointMake(frame.minX + 332.84, frame.minY + 100))
        stickBasePath.closePath()
        baseColor.setFill()
        stickBasePath.fill()
    }
}

