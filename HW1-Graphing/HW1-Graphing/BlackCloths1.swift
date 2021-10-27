//
//  BlackCloths1.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/19.
//

import Foundation
import SwiftUI

struct BlackCloths1: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            // left arm
            path.move(to: CGPoint(x: 120, y: 182.5))
            path.addQuadCurve(to: CGPoint(x: 124.2, y: 182.5), control: CGPoint(x: 124.2, y: 182.5))
            path.addQuadCurve(to: CGPoint(x: 56, y: 352), control: CGPoint(x: 123, y: 247))
            path.addQuadCurve(to: CGPoint(x: 124.2, y: 182.5), control: CGPoint(x: 123, y: 247))
            path.addQuadCurve(to: CGPoint(x: 131, y: 182.5), control: CGPoint(x: 131, y: 182.5))
            path.addQuadCurve(to: CGPoint(x: 62, y: 356), control: CGPoint(x: 135, y: 250))
            path.addQuadCurve(to: CGPoint(x: 131, y: 182.5), control: CGPoint(x: 135, y: 250))
            path.addQuadCurve(to: CGPoint(x: 137, y: 183.5), control: CGPoint(x: 134, y: 182.5))
            path.addQuadCurve(to: CGPoint(x: 68, y: 360), control: CGPoint(x: 140, y: 255))
            path.addQuadCurve(to: CGPoint(x: 137, y: 183.5), control: CGPoint(x: 140, y: 255))
            path.addQuadCurve(to: CGPoint(x: 138, y: 184), control: CGPoint(x: 138, y: 184))
            path.addQuadCurve(to: CGPoint(x: 71, y: 361), control: CGPoint(x: 144, y: 256))
            path.addQuadCurve(to: CGPoint(x: 52.5, y: 349), control: CGPoint(x: 67, y: 361))
            path.addQuadCurve(to: CGPoint(x: 103.5, y: 251), control: CGPoint(x: 98, y: 260))
            path.addQuadCurve(to: CGPoint(x: 120, y: 182.5), control: CGPoint(x: 113, y: 220))
            
            // right arm
            path.move(to: CGPoint(x: 212.5, y: 183))
            path.addQuadCurve(to: CGPoint(x: 225.5, y: 177.5), control: CGPoint(x: 215, y: 178.5))
            path.addLine(to: CGPoint(x: 220.5, y: 182.5))
            path.addLine(to: CGPoint(x: 212.5, y: 183))
            
            // skirt
            path.move(to: CGPoint(x: 140, y: 237.5))
            path.addQuadCurve(to: CGPoint(x: 136, y: 261), control: CGPoint(x: 141.5, y: 250))
            path.addQuadCurve(to: CGPoint(x: 88.5, y: 395.2), control: CGPoint(x: 98, y: 340))
            path.addQuadCurve(to: CGPoint(x: 101, y: 399.5), control: CGPoint(x: 96, y: 400))
            path.addQuadCurve(to: CGPoint(x: 105, y: 391), control: CGPoint(x: 103, y: 392))
            path.addQuadCurve(to: CGPoint(x: 101, y: 399.5), control: CGPoint(x: 103, y: 392))
            path.addQuadCurve(to: CGPoint(x: 115, y: 402.5), control: CGPoint(x: 100, y: 402))
            path.addQuadCurve(to: CGPoint(x: 150.5, y: 411), control: CGPoint(x: 144, y: 413))
            path.addQuadCurve(to: CGPoint(x: 150.5, y: 409), control: CGPoint(x: 150.5, y: 409))
            path.addQuadCurve(to: CGPoint(x: 145, y: 410.5), control: CGPoint(x: 141.5, y: 408.2))
            path.addQuadCurve(to: CGPoint(x: 144.5, y: 405), control: CGPoint(x: 143, y: 410))
            path.addQuadCurve(to: CGPoint(x: 145, y: 410.5), control: CGPoint(x: 143, y: 410))
            path.addQuadCurve(to: CGPoint(x: 150.5, y: 409), control: CGPoint(x: 141.5, y: 408.2))
            path.addQuadCurve(to: CGPoint(x: 167, y: 413.2), control: CGPoint(x: 160, y: 411))
            path.addQuadCurve(to: CGPoint(x: 200, y: 410.5), control: CGPoint(x: 180, y: 416.5))
            path.addQuadCurve(to: CGPoint(x: 219, y: 407), control: CGPoint(x: 210, y: 408))
            path.addQuadCurve(to: CGPoint(x: 219, y: 410), control: CGPoint(x: 219, y: 410))
            path.addQuadCurve(to: CGPoint(x: 228, y: 408), control: CGPoint(x: 227, y: 410.5))
            path.addQuadCurve(to: CGPoint(x: 219, y: 407), control: CGPoint(x: 227, y: 405.5))
            path.addQuadCurve(to: CGPoint(x: 228, y: 408), control: CGPoint(x: 227, y: 405.5))
            path.addQuadCurve(to: CGPoint(x: 219, y: 410), control: CGPoint(x: 227, y: 410.5))
            path.addQuadCurve(to: CGPoint(x: 231, y: 410), control: CGPoint(x: 224, y: 412))
            path.addQuadCurve(to: CGPoint(x: 245.5, y: 407.8), control: CGPoint(x: 240, y: 410.5))
            path.addQuadCurve(to: CGPoint(x: 246, y: 406), control: CGPoint(x: 246, y: 406))
            path.addQuadCurve(to: CGPoint(x: 249, y: 397), control: CGPoint(x: 246, y: 406))
            path.addQuadCurve(to: CGPoint(x: 246, y: 406), control: CGPoint(x: 246, y: 406))
            path.addQuadCurve(to: CGPoint(x: 260, y: 402), control: CGPoint(x: 257, y: 406))
            path.addQuadCurve(to: CGPoint(x: 264, y: 399.8), control: CGPoint(x: 262, y: 399.5))
            path.addQuadCurve(to: CGPoint(x: 212, y: 261), control: CGPoint(x: 255, y: 340))
            path.addQuadCurve(to: CGPoint(x: 210, y: 238), control: CGPoint(x: 206, y: 247))
            path.addQuadCurve(to: CGPoint(x: 140, y: 237.5), control: CGPoint(x: 175, y: 232))
        }
    }
}

struct BlackCloths1_Previews: PreviewProvider {
    static var previews: some View {
        BlackCloths1().stroke(.red, lineWidth: 1)
    }
}
