//
//  BlackCloths2.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/19.
//

import Foundation
import SwiftUI

struct BlackCloths2: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 215, y: 236.5))
            path.addQuadCurve(to: CGPoint(x: 218, y: 247.5), control: CGPoint(x: 217, y: 242))
            path.addQuadCurve(to: CGPoint(x: 220, y: 246), control: CGPoint(x: 219, y: 246))
            path.addQuadCurve(to: CGPoint(x: 240, y: 238.5), control: CGPoint(x: 230, y: 235))
            path.addQuadCurve(to: CGPoint(x: 238, y: 228.5), control: CGPoint(x: 238, y: 229))
            path.addQuadCurve(to: CGPoint(x: 234.5, y: 225.5), control: CGPoint(x: 237, y: 229))
            path.addQuadCurve(to: CGPoint(x: 237, y: 238), control: CGPoint(x: 236, y: 234))
            path.addQuadCurve(to: CGPoint(x: 234.5, y: 225.5), control: CGPoint(x: 236, y: 234))
            path.addQuadCurve(to: CGPoint(x: 229, y: 228.5), control: CGPoint(x: 234, y: 226))
            path.addQuadCurve(to: CGPoint(x: 231, y: 238), control: CGPoint(x: 230, y: 233))
            path.addQuadCurve(to: CGPoint(x: 229, y: 228.5), control: CGPoint(x: 230, y: 233))
            path.addQuadCurve(to: CGPoint(x: 217.5, y: 231), control: CGPoint(x: 225, y: 230))
            path.addQuadCurve(to: CGPoint(x: 215, y: 236.5), control: CGPoint(x: 219, y: 232))
            
            path.move(to: CGPoint(x: 268.2, y: 243.5))
            path.addQuadCurve(to: CGPoint(x: 267.5, y: 245.5), control: CGPoint(x: 268, y: 244))
            path.addQuadCurve(to: CGPoint(x: 269.5, y: 246), control: CGPoint(x: 268, y: 246))
            path.addQuadCurve(to: CGPoint(x: 274.2, y: 245), control: CGPoint(x: 271, y: 244.5))
            path.addQuadCurve(to: CGPoint(x: 275, y: 243.8), control: CGPoint(x: 274.5, y: 243.5))
            path.addQuadCurve(to: CGPoint(x: 268.2, y: 243.5), control: CGPoint(x: 272, y: 245))
        }
    }
}

struct BlackCloths2_Previews: PreviewProvider {
    static var previews: some View {
        BlackCloths2().stroke(.red, lineWidth: 1)
    }
}
