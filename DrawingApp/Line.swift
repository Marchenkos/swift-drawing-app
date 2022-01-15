import Foundation
import UIKit

struct Line {
    var color: CGColor
    var strokeWidth: CGFloat
    var point: [CGPoint] = []
    
    init(point: [CGPoint], color: CGColor = UIColor.black.cgColor, strokeWidth: CGFloat = 5.0) {
        self.color = color
        self.point = point
        self.strokeWidth = strokeWidth
    }
}
