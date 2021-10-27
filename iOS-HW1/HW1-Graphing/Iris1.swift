//
//  Iris1.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/14.
//

import Foundation
import SwiftUI

struct Iris1: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 148, y: 89))
            path.addQuadCurve(to: CGPoint(x: 150, y: 102), control: CGPoint(x: 145, y: 96))
            path.addQuadCurve(to: CGPoint(x: 161, y: 100), control: CGPoint(x: 157, y: 108))
            path.addQuadCurve(to: CGPoint(x: 160.5, y: 89), control: CGPoint(x: 162, y: 93))
            path.addQuadCurve(to: CGPoint(x: 148, y: 89), control: CGPoint(x: 157, y: 85))
        }
    }
}

struct Iris1_Previews: PreviewProvider {
    static var previews: some View {
        Iris1().stroke(.red, lineWidth: 1)
    }
}
