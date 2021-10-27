//
//  BigHairpin.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/14.
//

import Foundation
import SwiftUI

struct BigHairpin: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 198, y: 42))
            path.addQuadCurve(to: CGPoint(x: 203, y: 33), control: CGPoint(x: 197, y: 35))
            path.addQuadCurve(to: CGPoint(x: 211, y: 37), control: CGPoint(x: 208, y: 32))
            path.addLine(to: CGPoint(x: 209, y: 41))
            path.addQuadCurve(to: CGPoint(x: 204, y: 39), control: CGPoint(x: 206, y: 38))
            path.addQuadCurve(to: CGPoint(x: 202, y: 44), control: CGPoint(x: 201, y: 41))
            path.addLine(to: CGPoint(x: 198, y: 42))
            
            path.move(to: CGPoint(x: 202, y: 44))
            path.addLine(to: CGPoint(x: 198, y: 42))
            path.addQuadCurve(to: CGPoint(x: 197, y: 47), control: CGPoint(x: 192, y: 40))
            path.addLine(to: CGPoint(x: 209, y: 51))
            path.addLine(to: CGPoint(x: 215, y: 40))
            path.addQuadCurve(to: CGPoint(x: 213, y: 35), control: CGPoint(x: 215, y: 35))
            path.addQuadCurve(to: CGPoint(x: 211, y: 37), control: CGPoint(x: 211, y: 36))
            path.addLine(to: CGPoint(x: 209, y: 41))
            path.addQuadCurve(to: CGPoint(x: 207, y: 47), control: CGPoint(x: 211, y: 45))
            path.addQuadCurve(to: CGPoint(x: 202, y: 44), control: CGPoint(x: 204, y: 47))
        }
    }
}

struct BigHairpin_Previews: PreviewProvider {
    static var previews: some View {
        BigHairpin().stroke(.red, lineWidth: 1)
    }
}
