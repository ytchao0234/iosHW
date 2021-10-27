//
//  Ribbon.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/17.
//

import Foundation
import SwiftUI

struct Ribbon: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 124, y: 79))
            path.addQuadCurve(to: CGPoint(x: 109, y: 88.5), control: CGPoint(x: 120, y: 78))
            path.addQuadCurve(to: CGPoint(x: 117, y: 93), control: CGPoint(x: 115, y: 92))
            path.addQuadCurve(to: CGPoint(x: 124, y: 79), control: CGPoint(x: 117, y: 90))
        }
    }
}

struct Ribbon_Previews: PreviewProvider {
    static var previews: some View {
        Ribbon().stroke(.red, lineWidth: 1)
    }
}

