import Foundation
import UIKit

class Canvas: UIView {
    var color: CGColor = UIColor.black.cgColor
    var brushWidth: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    var lines: [[CGPoint]] = [];
    
    func setStyles(_ context: CGContext) {
        context.setLineWidth(brushWidth)
        context.setFillColor(color)
        context.setAlpha(opacity)
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        setStyles(context)
                
        lines.forEach { (line) in
            for (i, p) in line.enumerated() {
                if (i == 0) {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
        }
        
        context.strokePath()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: nil) else {
          return
        }
        
        guard var lastLine = lines.popLast() else {
            return
        }
        
        lastLine.append(touch)
        lines.append(lastLine)
        
        setNeedsDisplay()
    }
}
