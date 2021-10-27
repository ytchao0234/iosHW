//
//  Bag.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/20.
//

import Foundation
import SwiftUI

struct Bag: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 211, y: 256))
            path.addQuadCurve(to: CGPoint(x: 133, y: 283), control: CGPoint(x: 190, y: 264))
            path.addQuadCurve(to: CGPoint(x: 125, y: 277), control: CGPoint(x: 130, y: 280))
            path.addQuadCurve(to: CGPoint(x: 114, y: 272), control: CGPoint(x: 118, y: 273))
            path.addQuadCurve(to: CGPoint(x: 83.2, y: 311.5), control: CGPoint(x: 104, y: 280))
            path.addQuadCurve(to: CGPoint(x: 86, y: 314), control: CGPoint(x: 85, y: 313))
            path.addQuadCurve(to: CGPoint(x: 95, y: 319), control: CGPoint(x: 90, y: 317))
            path.addQuadCurve(to: CGPoint(x: 125, y: 279), control: CGPoint(x: 99, y: 310))
            path.addQuadCurve(to: CGPoint(x: 131, y: 283), control: CGPoint(x: 130, y: 282))
            path.addQuadCurve(to: CGPoint(x: 125, y: 279), control: CGPoint(x: 130, y: 282))
            path.addQuadCurve(to: CGPoint(x: 95, y: 319), control: CGPoint(x: 99, y: 310))
            path.addQuadCurve(to: CGPoint(x: 86, y: 314), control: CGPoint(x: 90, y: 317))
            path.addQuadCurve(to: CGPoint(x: 83, y: 319), control: CGPoint(x: 85, y: 315))
            path.addQuadCurve(to: CGPoint(x: 93, y: 325), control: CGPoint(x: 89, y: 323))
            path.addQuadCurve(to: CGPoint(x: 113, y: 295), control: CGPoint(x: 105, y: 305))
            path.addQuadCurve(to: CGPoint(x: 93, y: 325), control: CGPoint(x: 105, y: 305))
            path.addQuadCurve(to: CGPoint(x: 101, y: 329), control: CGPoint(x: 98, y: 329))
            path.addQuadCurve(to: CGPoint(x: 130, y: 288), control: CGPoint(x: 115, y: 310))
            path.addQuadCurve(to: CGPoint(x: 214, y: 261), control: CGPoint(x: 175, y: 278))
            path.addQuadCurve(to: CGPoint(x: 211, y: 256), control: CGPoint(x: 212, y: 258))
        }
    }
}

struct Bag_Previews: PreviewProvider {
    static var previews: some View {
        Bag().stroke(.red, lineWidth: 1)
    }
}

