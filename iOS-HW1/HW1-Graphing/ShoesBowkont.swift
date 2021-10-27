//
//  ShoesBowkont.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/20.
//

import Foundation
import SwiftUI

struct ShoesBowkont: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 147, y: 578))
            path.addQuadCurve(to: CGPoint(x: 137, y: 591), control: CGPoint(x: 139, y: 580))
            path.addQuadCurve(to: CGPoint(x: 147, y: 579), control: CGPoint(x: 146, y: 588))
            path.addQuadCurve(to: CGPoint(x: 160.5, y: 588.5), control: CGPoint(x: 152, y: 587))
            path.addQuadCurve(to: CGPoint(x: 147, y: 578), control: CGPoint(x: 159, y: 579))
        }
    }
}

struct ShoesBowkont_Previews: PreviewProvider {
    static var previews: some View {
        ShoesBowkont().stroke(.red, lineWidth: 1)
    }
}
