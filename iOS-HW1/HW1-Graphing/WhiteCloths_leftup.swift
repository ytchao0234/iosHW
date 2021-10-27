//
//  WhiteCloths_leftup.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/18.
//

import Foundation
import SwiftUI

struct WhiteCloths_leftup: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 135, y: 186))
            path.addQuadCurve(to: CGPoint(x: 125, y: 187), control: CGPoint(x: 131, y: 183))
            path.addQuadCurve(to: CGPoint(x: 120, y: 183), control: CGPoint(x: 120, y: 183))
            path.addQuadCurve(to: CGPoint(x: 110, y: 173), control: CGPoint(x: 122, y: 169))
            path.addQuadCurve(to: CGPoint(x: 111, y: 188), control: CGPoint(x: 104, y: 178))
            path.addQuadCurve(to: CGPoint(x: 109.5, y: 198), control: CGPoint(x: 110, y: 191))
            path.addQuadCurve(to: CGPoint(x: 87, y: 221), control: CGPoint(x: 99, y: 210))
            path.addQuadCurve(to: CGPoint(x: 98, y: 233), control: CGPoint(x: 88, y: 231))
            path.addQuadCurve(to: CGPoint(x: 108, y: 235), control: CGPoint(x: 100, y: 237))
            path.addQuadCurve(to: CGPoint(x: 118, y: 238.5), control: CGPoint(x: 108, y: 242))
            path.addQuadCurve(to: CGPoint(x: 127, y: 237.5), control: CGPoint(x: 121, y: 242))
            path.addQuadCurve(to: CGPoint(x: 141, y: 238), control: CGPoint(x: 132, y: 245))
            path.addQuadCurve(to: CGPoint(x: 135, y: 186), control: CGPoint(x: 119, y: 220))
        }
    }
}

struct WhiteCloths_leftup_Previews: PreviewProvider {
    static var previews: some View {
        WhiteCloths_leftup().stroke(.red, lineWidth: 1)
    }
}

