//
//  Shofar_Front.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/14.
//

import Foundation
import SwiftUI

struct Shofar_Front: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 114, y: 40))
            path.addQuadCurve(to: CGPoint(x: 115, y: 72), control: CGPoint(x: 128, y: 60))
            path.addQuadCurve(to: CGPoint(x: 131, y: 70), control: CGPoint(x: 124, y: 87))
            path.addQuadCurve(to: CGPoint(x: 114, y: 40), control: CGPoint(x: 137, y: 45))
        }
    }
}

struct Shofar_Front_Previews: PreviewProvider {
    static var previews: some View {
        Shofar_Front().stroke(.red, lineWidth: 1)
    }
}
