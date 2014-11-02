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

@IBDesignable internal class StickView: UIView {
    override func drawRect(rect: CGRect) {
        //When drawing in paintcode i uses a 500x500 frame.
        //Scale to match current frame
        CGContextScaleCTM(UIGraphicsGetCurrentContext(), rect.width/500.0, rect.height/500.0)
        drawKnob(frame: rect)
    }
    
    private func drawKnob(#frame: CGRect) {
        //// Color Declarations
        let nobColor = UIColor(red: 1.000, green: 0.000, blue: 0.000, alpha: 1.000)
        
        //// Knob Drawing
        var knobPath = UIBezierPath(ovalInRect: CGRectMake(frame.minX + 150, frame.minY + 150, 200, 200))
        nobColor.setFill()
        knobPath.fill()
    }
}
