//
//  CapeCloud.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/20.
//

import Foundation
import SwiftUI

struct CapeCloud: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 408))
            path.addQuadCurve(to: CGPoint(x: 0, y: 445), control: CGPoint(x: 0, y: 420))
            path.addQuadCurve(to: CGPoint(x: 1, y: 445), control: CGPoint(x: 0.5, y: 445))
            path.addQuadCurve(to: CGPoint(x: 27, y: 475), control: CGPoint(x: 3, y: 460))
            path.addQuadCurve(to: CGPoint(x: 65, y: 498), control: CGPoint(x: 35, y: 496))
            path.addQuadCurve(to: CGPoint(x: 100, y: 505), control: CGPoint(x: 78, y: 516))
            path.addQuadCurve(to: CGPoint(x: 128, y: 507), control: CGPoint(x: 115, y: 516))
            path.addQuadCurve(to: CGPoint(x: 150, y: 513), control: CGPoint(x: 140, y: 515))
            path.addQuadCurve(to: CGPoint(x: 177, y: 514), control: CGPoint(x: 170, y: 519))
            path.addQuadCurve(to: CGPoint(x: 200, y: 514), control: CGPoint(x: 180, y: 519))
            path.addQuadCurve(to: CGPoint(x: 221, y: 517), control: CGPoint(x: 210, y: 523))
            path.addQuadCurve(to: CGPoint(x: 239, y: 516), control: CGPoint(x: 230, y: 526))
            path.addQuadCurve(to: CGPoint(x: 296, y: 505), control: CGPoint(x: 260, y: 525))
            path.addQuadCurve(to: CGPoint(x: 345, y: 476), control: CGPoint(x: 326, y: 505))
            path.addQuadCurve(to: CGPoint(x: 360, y: 465), control: CGPoint(x: 356, y: 473))
            path.addQuadCurve(to: CGPoint(x: 360, y: 417), control: CGPoint(x: 360, y: 440))
            path.addQuadCurve(to: CGPoint(x: 352, y: 424), control: CGPoint(x: 351, y: 417))
            path.addQuadCurve(to: CGPoint(x: 335, y: 444), control: CGPoint(x: 338, y: 432))
            path.addQuadCurve(to: CGPoint(x: 329, y: 449), control: CGPoint(x: 331, y: 444))
            path.addQuadCurve(to: CGPoint(x: 309, y: 462), control: CGPoint(x: 316, y: 452))
            path.addQuadCurve(to: CGPoint(x: 305, y: 467), control: CGPoint(x: 305, y: 464))
            path.addQuadCurve(to: CGPoint(x: 283, y: 482), control: CGPoint(x: 289, y: 471))
            path.addQuadCurve(to: CGPoint(x: 235, y: 488), control: CGPoint(x: 255, y: 475))
            path.addQuadCurve(to: CGPoint(x: 200, y: 488), control: CGPoint(x: 220, y: 481))
            path.addQuadCurve(to: CGPoint(x: 150, y: 488), control: CGPoint(x: 176, y: 476))
            path.addQuadCurve(to: CGPoint(x: 126, y: 486), control: CGPoint(x: 135, y: 478))
            path.addQuadCurve(to: CGPoint(x: 94, y: 487), control: CGPoint(x: 108, y: 473))
            path.addQuadCurve(to: CGPoint(x: 68, y: 476), control: CGPoint(x: 85, y: 472))
            path.addQuadCurve(to: CGPoint(x: 50, y: 459), control: CGPoint(x: 65, y: 463))
            path.addQuadCurve(to: CGPoint(x: 32, y: 443), control: CGPoint(x: 44, y: 446))
            path.addQuadCurve(to: CGPoint(x: 18, y: 429), control: CGPoint(x: 27, y: 432))
            path.addQuadCurve(to: CGPoint(x: 0, y: 408), control: CGPoint(x: 16, y: 412))
        }
    }
}

struct CapeCloud_Previews: PreviewProvider {
    static var previews: some View {
        CapeCloud().stroke(.red, lineWidth: 1)
    }
}
