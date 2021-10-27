//
//  ShoesCloud.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/19.
//

import Foundation
import SwiftUI

struct ShoesCloud: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 133.2, y: 545))
            path.addQuadCurve(to: CGPoint(x: 125, y: 548.5), control: CGPoint(x: 129, y: 543))
            path.addQuadCurve(to: CGPoint(x: 110, y: 560), control: CGPoint(x: 111, y: 546))
            path.addQuadCurve(to: CGPoint(x: 118.5, y: 573.5), control: CGPoint(x: 113, y: 571))
            path.addQuadCurve(to: CGPoint(x: 131, y: 576), control: CGPoint(x: 123, y: 583.5))
            path.addQuadCurve(to: CGPoint(x: 149, y: 576.8), control: CGPoint(x: 140, y: 581.5))
            path.addQuadCurve(to: CGPoint(x: 157, y: 577), control: CGPoint(x: 153, y: 579))
            path.addQuadCurve(to: CGPoint(x: 169, y: 572), control: CGPoint(x: 167, y: 580))
            path.addQuadCurve(to: CGPoint(x: 173, y: 563), control: CGPoint(x: 173, y: 570))
            path.addQuadCurve(to: CGPoint(x: 170.2, y: 552), control: CGPoint(x: 175, y: 555))
            path.addQuadCurve(to: CGPoint(x: 165.5, y: 547), control: CGPoint(x: 169, y: 546))
            path.addLine(to: CGPoint(x: 165.5, y: 550))
            path.addQuadCurve(to: CGPoint(x: 163, y: 554), control: CGPoint(x: 164, y: 549))
            path.addQuadCurve(to: CGPoint(x: 152, y: 557), control: CGPoint(x: 159, y: 553))
            path.addQuadCurve(to: CGPoint(x: 138.5, y: 552.5), control: CGPoint(x: 145, y: 552))
            path.addQuadCurve(to: CGPoint(x: 133.8, y: 549), control: CGPoint(x: 135, y: 549))
            path.addLine(to: CGPoint(x: 133.2, y: 545))
        }
    }
}

struct ShoesCloud_Previews: PreviewProvider {
    static var previews: some View {
        ShoesCloud().stroke(.red, lineWidth: 1)
    }
}
