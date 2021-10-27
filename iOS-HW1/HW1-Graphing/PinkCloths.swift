//
//  PinkCloths.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/20.
//

import Foundation
import SwiftUI

struct PinkCloths: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            // left-up
            path.move(to: CGPoint(x: 114, y: 187.8))
            path.addQuadCurve(to: CGPoint(x: 110, y: 191), control: CGPoint(x: 112, y: 185))
            path.addQuadCurve(to: CGPoint(x: 112.5, y: 194.5), control: CGPoint(x: 109, y: 196))
            path.addQuadCurve(to: CGPoint(x: 114, y: 187.8), control: CGPoint(x: 115.5, y: 190))
            path.addQuadCurve(to: CGPoint(x: 112.5, y: 194.5), control: CGPoint(x: 115.5, y: 190))
            path.addQuadCurve(to: CGPoint(x: 130.5, y: 194.5), control: CGPoint(x: 115.5, y: 196))
            path.addQuadCurve(to: CGPoint(x: 133.5, y: 188.8), control: CGPoint(x: 131, y: 193))
            path.addQuadCurve(to: CGPoint(x: 114, y: 187.8), control: CGPoint(x: 130, y: 189.5))
            
            // left-down
            path.move(to: CGPoint(x: 81, y: 276))
            path.addQuadCurve(to: CGPoint(x: 66.5, y: 282), control: CGPoint(x: 70, y: 279))
            path.addQuadCurve(to: CGPoint(x: 69, y: 290), control: CGPoint(x: 65, y: 282))
            path.addQuadCurve(to: CGPoint(x: 80.5, y: 277), control: CGPoint(x: 76, y: 282))
            path.addQuadCurve(to: CGPoint(x: 79, y: 293), control: CGPoint(x: 80, y: 284))
            path.addQuadCurve(to: CGPoint(x: 88, y: 292), control: CGPoint(x: 83, y: 293))
            path.addQuadCurve(to: CGPoint(x: 81, y: 276), control: CGPoint(x: 84, y: 286))
            
            // right-up
            path.move(to: CGPoint(x: 215.5, y: 187.5))
            path.addQuadCurve(to: CGPoint(x: 237, y: 187), control: CGPoint(x: 225, y: 181))
            path.addQuadCurve(to: CGPoint(x: 238, y: 195), control: CGPoint(x: 237, y: 188))
            path.addQuadCurve(to: CGPoint(x: 236, y: 194), control: CGPoint(x: 236, y: 193))
            path.addQuadCurve(to: CGPoint(x: 235, y: 186), control: CGPoint(x: 234, y: 190))
            path.addQuadCurve(to: CGPoint(x: 236, y: 194), control: CGPoint(x: 234, y: 190))
            path.addQuadCurve(to: CGPoint(x: 217.5, y: 192), control: CGPoint(x: 226, y: 189))
            path.addQuadCurve(to: CGPoint(x: 215.5, y: 187.5), control: CGPoint(x: 216, y: 189))
            
            // right-down
            path.move(to: CGPoint(x: 259.5, y: 271.5))
            path.addQuadCurve(to: CGPoint(x: 271, y: 272), control: CGPoint(x: 267, y: 270))
            path.addQuadCurve(to: CGPoint(x: 270, y: 279), control: CGPoint(x: 271, y: 275))
            path.addQuadCurve(to: CGPoint(x: 260, y: 272), control: CGPoint(x: 269, y: 277))
            path.addQuadCurve(to: CGPoint(x: 268, y: 286), control: CGPoint(x: 266, y: 277))
            path.addQuadCurve(to: CGPoint(x: 263, y: 287), control: CGPoint(x: 263, y: 287))
            path.addQuadCurve(to: CGPoint(x: 259.5, y: 271.5), control: CGPoint(x: 262, y: 276))
            
            // center-up
            path.move(to: CGPoint(x: 175, y: 186))
            path.addQuadCurve(to: CGPoint(x: 170, y: 192), control: CGPoint(x: 173, y: 189))
            path.addQuadCurve(to: CGPoint(x: 180, y: 192), control: CGPoint(x: 174, y: 192))
            path.addQuadCurve(to: CGPoint(x: 175, y: 186), control: CGPoint(x: 176, y: 189))
            
            // center-down
            path.move(to: CGPoint(x: 130, y: 331))
            path.addQuadCurve(to: CGPoint(x: 136, y: 303), control: CGPoint(x: 129, y: 305))
            path.addQuadCurve(to: CGPoint(x: 130, y: 331), control: CGPoint(x: 139, y: 304))
            path.move(to: CGPoint(x: 221, y: 333))
            path.addQuadCurve(to: CGPoint(x: 215, y: 303.2), control: CGPoint(x: 209, y: 304))
            path.addQuadCurve(to: CGPoint(x: 221, y: 333), control: CGPoint(x: 220, y: 304))
        }
    }
}

struct PinkCloths_Previews: PreviewProvider {
    static var previews: some View {
        PinkCloths().stroke(.red, lineWidth: 1)
    }
}
