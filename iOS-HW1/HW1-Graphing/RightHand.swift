//
//  RightHand.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/20.
//

import Foundation
import SwiftUI

struct RightHand: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 287, y: 222))
            path.addQuadCurve(to: CGPoint(x: 283.5, y: 209), control: CGPoint(x: 284, y: 215))
            path.addQuadCurve(to: CGPoint(x: 283, y: 206.5), control: CGPoint(x: 284, y: 206))
            path.addQuadCurve(to: CGPoint(x: 283, y: 202.5), control: CGPoint(x: 285, y: 203))
            path.addQuadCurve(to: CGPoint(x: 280.5, y: 206), control: CGPoint(x: 282, y: 203))
            path.addQuadCurve(to: CGPoint(x: 283, y: 206.5), control: CGPoint(x: 282, y: 206.5))
            path.addQuadCurve(to: CGPoint(x: 280.5, y: 206), control: CGPoint(x: 282, y: 206.5))
            path.addQuadCurve(to: CGPoint(x: 266, y: 203), control: CGPoint(x: 277, y: 207))
            path.addQuadCurve(to: CGPoint(x: 279, y: 211), control: CGPoint(x: 269, y: 210))
            path.addQuadCurve(to: CGPoint(x: 280.5, y: 220), control: CGPoint(x: 279, y: 215))
            path.addQuadCurve(to: CGPoint(x: 285, y: 226.5), control: CGPoint(x: 284, y: 226))
            path.addQuadCurve(to: CGPoint(x: 280.5, y: 220), control: CGPoint(x: 284, y: 226))
            path.addQuadCurve(to: CGPoint(x: 276, y: 214), control: CGPoint(x: 277, y: 215))
            path.addQuadCurve(to: CGPoint(x: 258, y: 219.5), control: CGPoint(x: 264, y: 219.5))
            path.addQuadCurve(to: CGPoint(x: 274, y: 220), control: CGPoint(x: 263, y: 224))
            path.addQuadCurve(to: CGPoint(x: 278, y: 228), control: CGPoint(x: 276, y: 224))
            path.addQuadCurve(to: CGPoint(x: 272, y: 222), control: CGPoint(x: 274, y: 224))
            path.addQuadCurve(to: CGPoint(x: 258.5, y: 225), control: CGPoint(x: 271, y: 221))
            path.addQuadCurve(to: CGPoint(x: 269.5, y: 226.5), control: CGPoint(x: 260, y: 229))
            path.addQuadCurve(to: CGPoint(x: 276, y: 234), control: CGPoint(x: 271, y: 229))
            path.addQuadCurve(to: CGPoint(x: 268.5, y: 230.5), control: CGPoint(x: 271, y: 231))
            path.addQuadCurve(to: CGPoint(x: 259, y: 229), control: CGPoint(x: 265, y: 230.5))
            path.addQuadCurve(to: CGPoint(x: 267, y: 235), control: CGPoint(x: 258, y: 232))
            path.addQuadCurve(to: CGPoint(x: 270, y: 237), control: CGPoint(x: 270, y: 237))
            path.addQuadCurve(to: CGPoint(x: 274, y: 240), control: CGPoint(x: 274, y: 240))
            path.addQuadCurve(to: CGPoint(x: 270, y: 237), control: CGPoint(x: 274, y: 240))
            path.addQuadCurve(to: CGPoint(x: 268, y: 244), control: CGPoint(x: 269, y: 241))
            path.addQuadCurve(to: CGPoint(x: 279.5, y: 239), control: CGPoint(x: 275, y: 246))
            path.addQuadCurve(to: CGPoint(x: 281.5, y: 236), control: CGPoint(x: 280, y: 236))
            path.addQuadCurve(to: CGPoint(x: 282.5, y: 232), control: CGPoint(x: 283, y: 234))
            path.addQuadCurve(to: CGPoint(x: 285.5, y: 227), control: CGPoint(x: 286, y: 230))
            path.addQuadCurve(to: CGPoint(x: 287, y: 222), control: CGPoint(x: 288, y: 224))
        }
    }
}

struct RightHand_Previews: PreviewProvider {
    static var previews: some View {
        RightHand().stroke(.red, lineWidth: 1)
    }
}
