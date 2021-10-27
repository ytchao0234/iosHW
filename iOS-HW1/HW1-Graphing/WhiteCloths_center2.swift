//
//  WhiteCloths_center2.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/18.
//

import Foundation
import SwiftUI

struct WhiteCloths_center2: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 151, y: 159))
            path.addQuadCurve(to: CGPoint(x: 153, y: 159), control: CGPoint(x: 152, y: 159))
            path.addQuadCurve(to: CGPoint(x: 145, y: 181), control: CGPoint(x: 149, y: 170))
            path.addQuadCurve(to: CGPoint(x: 153, y: 159), control: CGPoint(x: 149, y: 170))
            path.addQuadCurve(to: CGPoint(x: 160, y: 159), control: CGPoint(x: 152, y: 159))
            path.addQuadCurve(to: CGPoint(x: 154, y: 181), control: CGPoint(x: 157, y: 170))
            path.addQuadCurve(to: CGPoint(x: 160, y: 159), control: CGPoint(x: 157, y: 170))
            path.addQuadCurve(to: CGPoint(x: 167, y: 159), control: CGPoint(x: 157, y: 159))
            path.addQuadCurve(to: CGPoint(x: 164, y: 181), control: CGPoint(x: 165, y: 170))
            path.addQuadCurve(to: CGPoint(x: 167, y: 159), control: CGPoint(x: 165, y: 170))
            path.addQuadCurve(to: CGPoint(x: 174, y: 159), control: CGPoint(x: 165, y: 159))
            path.addQuadCurve(to: CGPoint(x: 172, y: 181), control: CGPoint(x: 173, y: 170))
            path.addQuadCurve(to: CGPoint(x: 174, y: 159), control: CGPoint(x: 173, y: 170))
            path.addQuadCurve(to: CGPoint(x: 182, y: 159), control: CGPoint(x: 173, y: 159))
            path.addQuadCurve(to: CGPoint(x: 183, y: 182), control: CGPoint(x: 182, y: 170))
            path.addQuadCurve(to: CGPoint(x: 182, y: 159), control: CGPoint(x: 182, y: 170))
            path.addQuadCurve(to: CGPoint(x: 191, y: 159), control: CGPoint(x: 182, y: 159))
            path.addQuadCurve(to: CGPoint(x: 193, y: 181), control: CGPoint(x: 191, y: 170))
            path.addQuadCurve(to: CGPoint(x: 191, y: 159), control: CGPoint(x: 191, y: 170))
            path.addQuadCurve(to: CGPoint(x: 196, y: 159), control: CGPoint(x: 191, y: 159))
            path.addQuadCurve(to: CGPoint(x: 206, y: 181), control: CGPoint(x: 200, y: 170))
            path.addQuadCurve(to: CGPoint(x: 196, y: 159), control: CGPoint(x: 200, y: 170))
            path.addQuadCurve(to: CGPoint(x: 197, y: 159), control: CGPoint(x: 191, y: 159))
            path.addQuadCurve(to: CGPoint(x: 211, y: 182), control: CGPoint(x: 203, y: 170))
            path.addQuadCurve(to: CGPoint(x: 136, y: 184), control: CGPoint(x: 200, y: 185))
            path.addQuadCurve(to: CGPoint(x: 151, y: 159), control: CGPoint(x: 146, y: 170))
        }
    }
}

struct WhiteCloths_center2_Previews: PreviewProvider {
    static var previews: some View {
        WhiteCloths_center2().stroke(.red, lineWidth: 1)
    }
}
