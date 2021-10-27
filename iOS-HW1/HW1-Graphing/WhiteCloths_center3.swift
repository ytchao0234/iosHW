//
//  WhiteCloths_center3.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/18.
//

import Foundation
import SwiftUI

struct WhiteCloths_center3: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 137, y: 183))
            path.addQuadCurve(to: CGPoint(x: 128, y: 201), control: CGPoint(x: 131, y: 193))
            path.addQuadCurve(to: CGPoint(x: 134, y: 202), control: CGPoint(x: 131, y: 205))
            path.addQuadCurve(to: CGPoint(x: 151, y: 198), control: CGPoint(x: 142, y: 208))
            path.addQuadCurve(to: CGPoint(x: 163.5, y: 194.2), control: CGPoint(x: 163, y: 200))
            path.addQuadCurve(to: CGPoint(x: 175, y: 186), control: CGPoint(x: 172, y: 193))
            path.addQuadCurve(to: CGPoint(x: 187, y: 194.2), control: CGPoint(x: 178, y: 193))
            path.addQuadCurve(to: CGPoint(x: 199, y: 198), control: CGPoint(x: 188, y: 200))
            path.addQuadCurve(to: CGPoint(x: 216, y: 202), control: CGPoint(x: 206, y: 208))
            path.addQuadCurve(to: CGPoint(x: 221, y: 202.5), control: CGPoint(x: 218, y: 204))
            path.addQuadCurve(to: CGPoint(x: 213, y: 183), control: CGPoint(x: 219, y: 193))
            path.addQuadCurve(to: CGPoint(x: 202, y: 182.5), control: CGPoint(x: 208, y: 180))
            path.addQuadCurve(to: CGPoint(x: 183, y: 182.5), control: CGPoint(x: 192, y: 178))
            path.addQuadCurve(to: CGPoint(x: 166.5, y: 182.5), control: CGPoint(x: 175, y: 177))
            path.addQuadCurve(to: CGPoint(x: 147, y: 182.5), control: CGPoint(x: 158, y: 178))
            path.addQuadCurve(to: CGPoint(x: 137, y: 183), control: CGPoint(x: 144, y: 180))
        }
    }
}

struct WhiteCloths_center3_Previews: PreviewProvider {
    static var previews: some View {
        WhiteCloths_center3().stroke(.red, lineWidth: 1)
    }
}
