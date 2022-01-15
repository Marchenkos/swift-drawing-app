import Foundation
import UIKit

class Canvas: UIView {
    var color: CGColor = UIColor.black.cgColor
    var strokeWidth: CGFloat = 5.0
    var lines: [Line] = [];
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
                        
        lines.forEach { (line) in
            context.setLineWidth(line.strokeWidth)
            context.setStrokeColor(line.color)

            for (i, p) in line.point.enumerated() {
                if (i == 0) {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
            
            context.strokePath()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(Line.init(point: [CGPoint](), color: self.color, strokeWidth: self.strokeWidth))

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: nil) else {
          return
        }
        
        guard var lastLine = lines.popLast() else {
            return
        }
        
        lastLine.point.append(touch)
        lines.append(lastLine)
        
        setNeedsDisplay()
    }

    func undo() {
        if (lines.count > 0) {
            lines.removeLast()

            setNeedsDisplay()
        }
    }
    
    func clearAll() {
        if (lines.count > 0) {
            lines.removeAll()
            
            setNeedsDisplay()
        }
    }
    
    func setColor(_ newColor:CGColor) {
        color = newColor
    }
    
    func setStrokeWidth(_ newStrokeWidth:CGFloat) {
        strokeWidth = newStrokeWidth
    }
}
