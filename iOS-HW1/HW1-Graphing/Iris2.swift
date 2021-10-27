//
//  Iris2.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/14.
//

import Foundation
import SwiftUI

struct Iris2: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 153, y: 95))
            path.addQuadCurve(to: CGPoint(x: 150, y: 96), control: CGPoint(x: 152, y: 94))
            path.addQuadCurve(to: CGPoint(x: 156, y: 104.5), control: CGPoint(x: 149, y: 102))
            path.addQuadCurve(to: CGPoint(x: 159, y: 95), control: CGPoint(x: 161, y: 102))
            path.addQuadCurve(to: CGPoint(x: 156.5, y: 94), control: CGPoint(x: 159, y: 95))
            path.addQuadCurve(to: CGPoint(x: 155, y: 99.5), control: CGPoint(x: 159, y: 98))
            path.addQuadCurve(to: CGPoint(x: 153, y: 95), control: CGPoint(x: 153, y: 98))
        }
    }
}

struct Iris2_Previews: PreviewProvider {
    static var previews: some View {
        Iris2().stroke(.red, lineWidth: 1)
    }
}
