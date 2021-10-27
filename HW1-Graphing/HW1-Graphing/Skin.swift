//
//  Skin.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/18.
//

import Foundation
import SwiftUI

struct Skin: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            // neck
            path.addLines([
                CGPoint(x: 164, y: 132),
                CGPoint(x: 164, y: 136),
                CGPoint(x: 184, y: 136),
                CGPoint(x: 184, y: 132),
                CGPoint(x: 164, y: 132),
            ])
            
            // left shoulder
            path.move(to: CGPoint(x: 138, y: 175))
            path.addQuadCurve(to: CGPoint(x: 137, y: 183), control: CGPoint(x: 140, y: 179))
            path.addQuadCurve(to: CGPoint(x: 121, y: 182), control: CGPoint(x: 133, y: 183))
            path.addQuadCurve(to: CGPoint(x: 153, y: 153), control: CGPoint(x: 120, y: 152))
            path.addQuadCurve(to: CGPoint(x: 137, y: 183), control: CGPoint(x: 154, y: 158))
            
            // right shoulder
            path.move(to: CGPoint(x: 213, y: 175))
            path.addQuadCurve(to: CGPoint(x: 212, y: 183), control: CGPoint(x: 210, y: 179))
            path.addQuadCurve(to: CGPoint(x: 228, y: 177), control: CGPoint(x: 214, y: 179))
            path.addQuadCurve(to: CGPoint(x: 197, y: 153), control: CGPoint(x: 225, y: 152))
            path.addQuadCurve(to: CGPoint(x: 213, y: 183), control: CGPoint(x: 194, y: 158))
            
            // left leg
            path.move(to: CGPoint(x: 172, y: 414))
            path.addQuadCurve(to: CGPoint(x: 123, y: 406), control: CGPoint(x: 150, y: 405))
            path.addQuadCurve(to: CGPoint(x: 139, y: 452), control: CGPoint(x: 129, y: 420))
            path.addQuadCurve(to: CGPoint(x: 139, y: 484), control: CGPoint(x: 144, y: 467))
            path.addQuadCurve(to: CGPoint(x: 134, y: 550), control: CGPoint(x: 128, y: 511))
            path.addQuadCurve(to: CGPoint(x: 166, y: 549), control: CGPoint(x: 160, y: 575))
            path.addQuadCurve(to: CGPoint(x: 170, y: 482), control: CGPoint(x: 165, y: 520))
            path.addQuadCurve(to: CGPoint(x: 171.5, y: 456), control: CGPoint(x: 174, y: 469))
            path.addQuadCurve(to: CGPoint(x: 172, y: 414), control: CGPoint(x: 172, y: 420))
            
            path.move(to: CGPoint(x: 154, y: 472))
            path.addQuadCurve(to: CGPoint(x: 160, y: 480), control: CGPoint(x: 157, y: 477))
            path.move(to: CGPoint(x: 168, y: 472))
            path.addQuadCurve(to: CGPoint(x: 165, y: 480), control: CGPoint(x: 166, y: 477))
            
            // right leg
            path.move(to: CGPoint(x: 178, y: 414))
            path.addQuadCurve(to: CGPoint(x: 225, y: 410), control: CGPoint(x: 215, y: 400))
            path.addQuadCurve(to: CGPoint(x: 210, y: 452), control: CGPoint(x: 221, y: 422))
            path.addQuadCurve(to: CGPoint(x: 211, y: 484), control: CGPoint(x: 206, y: 467))
            path.addQuadCurve(to: CGPoint(x: 216, y: 550), control: CGPoint(x: 220, y: 511))
            path.addQuadCurve(to: CGPoint(x: 184, y: 549), control: CGPoint(x: 185, y: 575))
            path.addQuadCurve(to: CGPoint(x: 179, y: 482), control: CGPoint(x: 184, y: 520))
            path.addQuadCurve(to: CGPoint(x: 178, y: 456), control: CGPoint(x: 175, y: 469))
            path.addQuadCurve(to: CGPoint(x: 178, y: 414), control: CGPoint(x: 178, y: 420))
            
            path.move(to: CGPoint(x: 196, y: 470))
            path.addQuadCurve(to: CGPoint(x: 190, y: 480), control: CGPoint(x: 192, y: 477))
            path.move(to: CGPoint(x: 181, y: 470))
            path.addQuadCurve(to: CGPoint(x: 184, y: 479), control: CGPoint(x: 184, y: 477))
            
            // left hand
            path.move(to: CGPoint(x: 53, y: 349))
            path.addQuadCurve(to: CGPoint(x: 47, y: 353), control: CGPoint(x: 52, y: 350.5))
            path.addQuadCurve(to: CGPoint(x: 42, y: 356.5), control: CGPoint(x: 42, y: 355.5))
            path.addQuadCurve(to: CGPoint(x: 26, y: 363), control: CGPoint(x: 35, y: 360))
            path.addQuadCurve(to: CGPoint(x: 32, y: 365), control: CGPoint(x: 24, y: 365.5))
            path.addQuadCurve(to: CGPoint(x: 43, y: 359), control: CGPoint(x: 40, y: 361))
            path.addQuadCurve(to: CGPoint(x: 48, y: 356), control: CGPoint(x: 44, y: 357))
            path.addQuadCurve(to: CGPoint(x: 43, y: 359), control: CGPoint(x: 44, y: 357))
            path.addQuadCurve(to: CGPoint(x: 32, y: 365), control: CGPoint(x: 40, y: 361))
            path.addQuadCurve(to: CGPoint(x: 25, y: 368), control: CGPoint(x: 28, y: 367))
            path.addQuadCurve(to: CGPoint(x: 30, y: 370), control: CGPoint(x: 19, y: 371))
            path.addQuadCurve(to: CGPoint(x: 44, y: 362), control: CGPoint(x: 36, y: 368))
            path.addQuadCurve(to: CGPoint(x: 50, y: 358), control: CGPoint(x: 45, y: 360))
            path.addQuadCurve(to: CGPoint(x: 44, y: 362), control: CGPoint(x: 45, y: 360))
            path.addQuadCurve(to: CGPoint(x: 30, y: 370), control: CGPoint(x: 36, y: 368))
            path.addQuadCurve(to: CGPoint(x: 22, y: 373), control: CGPoint(x: 25, y: 372.5))
            path.addQuadCurve(to: CGPoint(x: 27, y: 375.5), control: CGPoint(x: 18, y: 377))
            path.addQuadCurve(to: CGPoint(x: 47, y: 365), control: CGPoint(x: 40, y: 370))
            path.addQuadCurve(to: CGPoint(x: 53, y: 361), control: CGPoint(x: 50, y: 362))
            path.addQuadCurve(to: CGPoint(x: 47, y: 365), control: CGPoint(x: 50, y: 362))
            path.addQuadCurve(to: CGPoint(x: 27, y: 375.5), control: CGPoint(x: 40, y: 370))
            path.addQuadCurve(to: CGPoint(x: 32, y: 377.5), control: CGPoint(x: 22, y: 379))
            path.addQuadCurve(to: CGPoint(x: 63, y: 365), control: CGPoint(x: 58, y: 366))
            path.addQuadCurve(to: CGPoint(x: 62, y: 370), control: CGPoint(x: 63, y: 367))
            path.addQuadCurve(to: CGPoint(x: 60, y: 383), control: CGPoint(x: 55, y: 379))
            path.addQuadCurve(to: CGPoint(x: 67, y: 372), control: CGPoint(x: 62, y: 377))
            path.addQuadCurve(to: CGPoint(x: 70, y: 361), control: CGPoint(x: 69, y: 365))
            path.addQuadCurve(to: CGPoint(x: 53, y: 349), control: CGPoint(x: 66, y: 360))
        }
    }
}

struct Skin_Previews: PreviewProvider {
    static var previews: some View {
        Skin().stroke(.red, lineWidth: 1)
    }
}

