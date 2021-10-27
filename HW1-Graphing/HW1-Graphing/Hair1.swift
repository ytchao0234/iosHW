//
//  Hair1.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/14.
//

import Foundation
import SwiftUI

struct Hair1: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 179, y: 23))
            path.addQuadCurve(to: CGPoint(x: 139, y: 45), control: CGPoint(x: 158, y: 14))
            path.addQuadCurve(to: CGPoint(x: 140, y: 98), control: CGPoint(x: 121, y: 85))
            path.addQuadCurve(to: CGPoint(x: 136, y: 93), control: CGPoint(x: 136, y: 93))
            path.addQuadCurve(to: CGPoint(x: 142, y: 95), control: CGPoint(x: 138, y: 95))
            path.addQuadCurve(to: CGPoint(x: 139, y: 83), control: CGPoint(x: 139, y: 90))
            path.addQuadCurve(to: CGPoint(x: 144, y: 96), control: CGPoint(x: 141, y: 93))
            path.addQuadCurve(to: CGPoint(x: 143, y: 60), control: CGPoint(x: 139, y: 87))
            path.addQuadCurve(to: CGPoint(x: 144, y: 90), control: CGPoint(x: 141, y: 86))
            path.addQuadCurve(to: CGPoint(x: 146, y: 79), control: CGPoint(x: 145, y: 80))
            path.addQuadCurve(to: CGPoint(x: 152, y: 88), control: CGPoint(x: 146, y: 84))
            path.addQuadCurve(to: CGPoint(x: 159.5, y: 40), control: CGPoint(x: 151, y: 69))
            path.addQuadCurve(to: CGPoint(x: 179, y: 25), control: CGPoint(x: 167, y: 24))
            path.addQuadCurve(to: CGPoint(x: 159.5, y: 40), control: CGPoint(x: 167, y: 24))
            path.addQuadCurve(to: CGPoint(x: 161, y: 88), control: CGPoint(x: 149, y: 70))
            path.addQuadCurve(to: CGPoint(x: 165, y: 66), control: CGPoint(x: 161, y: 77))
            path.addQuadCurve(to: CGPoint(x: 163, y: 89), control: CGPoint(x: 163, y: 77))
            path.addQuadCurve(to: CGPoint(x: 173, y: 70), control: CGPoint(x: 170, y: 83))
            path.addQuadCurve(to: CGPoint(x: 167, y: 90), control: CGPoint(x: 171, y: 87))
            path.addQuadCurve(to: CGPoint(x: 181, y: 59), control: CGPoint(x: 171, y: 90))
            path.addQuadCurve(to: CGPoint(x: 170, y: 90), control: CGPoint(x: 175, y: 85))
            path.addQuadCurve(to: CGPoint(x: 184, y: 58), control: CGPoint(x: 179, y: 84))
            path.addQuadCurve(to: CGPoint(x: 179, y: 25), control: CGPoint(x: 188, y: 27))
            path.addQuadCurve(to: CGPoint(x: 184, y: 58), control: CGPoint(x: 188, y: 27))
            path.addQuadCurve(to: CGPoint(x: 182, y: 89), control: CGPoint(x: 184, y: 76))
            path.addQuadCurve(to: CGPoint(x: 189.5, y: 70), control: CGPoint(x: 187, y: 86))
            path.addQuadCurve(to: CGPoint(x: 186, y: 35), control: CGPoint(x: 192, y: 55))
            path.addQuadCurve(to: CGPoint(x: 189.5, y: 70), control: CGPoint(x: 192, y: 55))
            path.addQuadCurve(to: CGPoint(x: 197, y: 85), control: CGPoint(x: 193, y: 83))
            path.addQuadCurve(to: CGPoint(x: 200, y: 70), control: CGPoint(x: 199, y: 78))
            path.addQuadCurve(to: CGPoint(x: 179, y: 25), control: CGPoint(x: 195, y: 22))
            path.addQuadCurve(to: CGPoint(x: 200, y: 70), control: CGPoint(x: 195, y: 22))
            path.addQuadCurve(to: CGPoint(x: 203, y: 91), control: CGPoint(x: 203, y: 85))
            path.addQuadCurve(to: CGPoint(x: 205, y: 83), control: CGPoint(x: 204, y: 89))
            path.addQuadCurve(to: CGPoint(x: 203.5, y: 96.5), control: CGPoint(x: 206, y: 89))
            path.addQuadCurve(to: CGPoint(x: 209, y: 93), control: CGPoint(x: 206, y: 97))
            path.addQuadCurve(to: CGPoint(x: 207.5, y: 100), control: CGPoint(x: 209, y: 96))
            path.addQuadCurve(to: CGPoint(x: 215.5, y: 55), control: CGPoint(x: 219, y: 93))
            path.addQuadCurve(to: CGPoint(x: 179, y: 23), control: CGPoint(x: 205, y: 19))
        }
    }
}

struct Hair1_Previews: PreviewProvider {
    static var previews: some View {
        Hair1().stroke(.red, lineWidth: 1)
    }
}
