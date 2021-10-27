//
//  Harp3.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/20.
//

import Foundation
import SwiftUI

struct Harp3: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 289, y: 140))
            path.addQuadCurve(to: CGPoint(x: 244, y: 167), control: CGPoint(x: 260, y: 157))
            path.addQuadCurve(to: CGPoint(x: 218, y: 193), control: CGPoint(x: 227, y: 178))
            path.addQuadCurve(to: CGPoint(x: 217.5, y: 229), control: CGPoint(x: 226, y: 212))
            path.addQuadCurve(to: CGPoint(x: 217.5, y: 229), control: CGPoint(x: 226, y: 212))
            path.addQuadCurve(to: CGPoint(x: 235.5, y: 300), control: CGPoint(x: 230, y: 280))
            path.addQuadCurve(to: CGPoint(x: 236, y: 316), control: CGPoint(x: 237, y: 315))
            path.addQuadCurve(to: CGPoint(x: 240.5, y: 306), control: CGPoint(x: 239, y: 310))
            path.addQuadCurve(to: CGPoint(x: 220, y: 222), control: CGPoint(x: 221, y: 230))
            path.addQuadCurve(to: CGPoint(x: 221.5, y: 204), control: CGPoint(x: 223, y: 215))
            path.addQuadCurve(to: CGPoint(x: 248, y: 169.5), control: CGPoint(x: 228, y: 181))
            path.addQuadCurve(to: CGPoint(x: 289, y: 146), control: CGPoint(x: 283, y: 147))
            path.addQuadCurve(to: CGPoint(x: 248, y: 169.5), control: CGPoint(x: 283, y: 147))
            path.addQuadCurve(to: CGPoint(x: 221.5, y: 204), control: CGPoint(x: 228, y: 181))
            path.addQuadCurve(to: CGPoint(x: 220, y: 222), control: CGPoint(x: 223, y: 215))
            path.addQuadCurve(to: CGPoint(x: 240.5, y: 306), control: CGPoint(x: 221, y: 230))
            path.addQuadCurve(to: CGPoint(x: 246.5, y: 290), control: CGPoint(x: 240, y: 308))
            path.addQuadCurve(to: CGPoint(x: 227, y: 235), control: CGPoint(x: 234, y: 265))
            path.addQuadCurve(to: CGPoint(x: 243.5, y: 180), control: CGPoint(x: 223, y: 200))
            path.addQuadCurve(to: CGPoint(x: 282.5, y: 156), control: CGPoint(x: 272, y: 160))
            path.addQuadCurve(to: CGPoint(x: 289, y: 140), control: CGPoint(x: 291, y: 150))
        }
    }
}

struct Harp3_Previews: PreviewProvider {
    static var previews: some View {
        Harp3().stroke(.red, lineWidth: 1)
    }
}
