//
//  Eyebrow.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/17.
//

import Foundation
import SwiftUI

struct Eyebrow: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 166, y: 68))
            path.addQuadCurve(to: CGPoint(x: 140, y: 77), control: CGPoint(x: 155, y: 66))
        }
    }
}

struct Eyebrow_Previews: PreviewProvider {
    static var previews: some View {
        Eyebrow().stroke(.red, lineWidth: 1)
    }
}
