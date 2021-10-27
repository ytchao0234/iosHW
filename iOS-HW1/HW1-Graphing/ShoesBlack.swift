//
//  ShoesBlack.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/20.
//

import Foundation
import SwiftUI

struct ShoesBlack: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 129.5, y: 577.5))
            path.addQuadCurve(to: CGPoint(x: 138, y: 606), control: CGPoint(x: 130.5, y: 588))
            path.addQuadCurve(to: CGPoint(x: 144.5, y: 629.5), control: CGPoint(x: 147, y: 625))
            path.addQuadCurve(to: CGPoint(x: 146.5, y: 632), control: CGPoint(x: 147, y: 632))
            path.addQuadCurve(to: CGPoint(x: 145, y: 643), control: CGPoint(x: 144.5, y: 638))
            path.addQuadCurve(to: CGPoint(x: 140.2, y: 680), control: CGPoint(x: 139, y: 670))
            path.addQuadCurve(to: CGPoint(x: 155, y: 688.5), control: CGPoint(x: 142, y: 687))
            path.addQuadCurve(to: CGPoint(x: 170.5, y: 681), control: CGPoint(x: 167, y: 688))
            path.addQuadCurve(to: CGPoint(x: 165.8, y: 638), control: CGPoint(x: 171, y: 670))
            path.addQuadCurve(to: CGPoint(x: 165, y: 629.5), control: CGPoint(x: 167, y: 630))
            path.addQuadCurve(to: CGPoint(x: 166.5, y: 626), control: CGPoint(x: 166, y: 628))
            path.addQuadCurve(to: CGPoint(x: 165, y: 620), control: CGPoint(x: 164.5, y: 625))
            path.addQuadCurve(to: CGPoint(x: 166.2, y: 577), control: CGPoint(x: 166, y: 600))
            path.addQuadCurve(to: CGPoint(x: 148, y: 577), control: CGPoint(x: 158, y: 576))
            path.addQuadCurve(to: CGPoint(x: 155.5, y: 626), control: CGPoint(x: 153.5, y: 580))
            path.addQuadCurve(to: CGPoint(x: 156.2, y: 644), control: CGPoint(x: 159, y: 644))
            path.addQuadCurve(to: CGPoint(x: 155.2, y: 626), control: CGPoint(x: 154, y: 644))
            path.addQuadCurve(to: CGPoint(x: 151, y: 606), control: CGPoint(x: 152, y: 606))
            path.addQuadCurve(to: CGPoint(x: 144, y: 577), control: CGPoint(x: 143, y: 583))
            path.addQuadCurve(to: CGPoint(x: 129.5, y: 577.5), control: CGPoint(x: 130, y: 573))
        }
    }
}

struct ShoesBlack_Previews: PreviewProvider {
    static var previews: some View {
        ShoesBlack().stroke(.red, lineWidth: 1)
    }
}
