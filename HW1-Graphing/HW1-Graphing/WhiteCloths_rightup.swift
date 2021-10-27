//
//  WhiteCloths_rightup.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/18.
//

import Foundation
import SwiftUI

struct WhiteCloths_rightup: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 212.5, y: 183.5))
            path.addQuadCurve(to: CGPoint(x: 221, y: 182), control: CGPoint(x: 217, y: 180))
            path.addQuadCurve(to: CGPoint(x: 237, y: 182), control: CGPoint(x: 228, y: 172))
            path.addQuadCurve(to: CGPoint(x: 238.5, y: 197), control: CGPoint(x: 237, y: 190))
            path.addQuadCurve(to: CGPoint(x: 265, y: 223), control: CGPoint(x: 248, y: 210))
            path.addQuadCurve(to: CGPoint(x: 246, y: 228.5), control: CGPoint(x: 253, y: 232))
            path.addQuadCurve(to: CGPoint(x: 234.5, y: 225.5), control: CGPoint(x: 238, y: 231))
            path.addQuadCurve(to: CGPoint(x: 218, y: 231), control: CGPoint(x: 230, y: 229))
            path.addQuadCurve(to: CGPoint(x: 211, y: 237), control: CGPoint(x: 217, y: 238))
            path.addQuadCurve(to: CGPoint(x: 212.5, y: 183.5), control: CGPoint(x: 230, y: 212))

            path.move(to: CGPoint(x: 211, y: 237))
            path.addQuadCurve(to: CGPoint(x: 218, y: 231), control: CGPoint(x: 217, y: 238))
            path.addQuadCurve(to: CGPoint(x: 234.5, y: 225.5), control: CGPoint(x: 230, y: 229))
            path.addQuadCurve(to: CGPoint(x: 246, y: 228.5), control: CGPoint(x: 238, y: 231))
            path.addQuadCurve(to: CGPoint(x: 265, y: 223), control: CGPoint(x: 253, y: 232))
            path.addQuadCurve(to: CGPoint(x: 209, y: 240), control: CGPoint(x: 240, y: 249))
        }
    }
}

struct WhiteCloths_rightup_Previews: PreviewProvider {
    static var previews: some View {
        WhiteCloths_rightup().stroke(.red, lineWidth: 1)
    }
}
