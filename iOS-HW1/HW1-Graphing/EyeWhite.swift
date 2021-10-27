//
//  EyeWhite.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/14.
//

import Foundation
import SwiftUI

struct EyeWhite: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 141, y: 93))
            path.addQuadCurve(to: CGPoint(x: 156, y: 104.5), control: CGPoint(x: 144, y: 105))
            path.addQuadCurve(to: CGPoint(x: 165, y: 92), control: CGPoint(x: 163, y: 102))
            path.addQuadCurve(to: CGPoint(x: 141, y: 93), control: CGPoint(x: 155, y: 82))
        }
    }
}

struct EyeWhite_Previews: PreviewProvider {
    static var previews: some View {
        EyeWhite().stroke(.red, lineWidth: 1)
    }
}
