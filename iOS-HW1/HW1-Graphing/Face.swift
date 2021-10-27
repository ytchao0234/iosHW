//
//  Face.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/14.
//

import Foundation
import SwiftUI

struct Face: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 140, y: 97))
            path.addQuadCurve(to: CGPoint(x: 147, y: 120), control: CGPoint(x: 144, y: 113))
            path.addQuadCurve(to: CGPoint(x: 175, y: 136), control: CGPoint(x: 150, y: 127))
            path.addQuadCurve(to: CGPoint(x: 202, y: 120), control: CGPoint(x: 197, y: 127))
            path.addQuadCurve(to: CGPoint(x: 209, y: 97), control: CGPoint(x: 204, y: 113))
            path.addLines([
                CGPoint(x: 209, y: 97),
                CGPoint(x: 209, y: 50),
                CGPoint(x: 140, y: 50),
                CGPoint(x: 140, y: 97)
            ])
        }
    }
}

struct Face_Previews: PreviewProvider {
    static var previews: some View {
        Face().stroke(.red, lineWidth: 1)
    }
}
