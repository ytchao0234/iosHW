//
//  CapePink.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/20.
//

import Foundation
import SwiftUI

struct CapePink: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 150, y: 157))
            path.addQuadCurve(to: CGPoint(x: 8, y: 412), control: CGPoint(x: 69, y: 360))
            path.addQuadCurve(to: CGPoint(x: 67, y: 486), control: CGPoint(x: 20, y: 460))
            path.addQuadCurve(to: CGPoint(x: 286, y: 490), control: CGPoint(x: 170, y: 510))
            path.addQuadCurve(to: CGPoint(x: 352, y: 420), control: CGPoint(x: 350, y: 460))
            path.addQuadCurve(to: CGPoint(x: 200, y: 157), control: CGPoint(x: 279, y: 360))
            path.addQuadCurve(to: CGPoint(x: 150, y: 157), control: CGPoint(x: 150, y: 157))
        }
    }
}

struct CapePink_Previews: PreviewProvider {
    static var previews: some View {
        CapePink().stroke(.red, lineWidth: 1)
    }
}
