//
//  Eyelash.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/14.
//

import Foundation
import SwiftUI

struct Eyelash: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 164, y: 85))
            path.addQuadCurve(to: CGPoint(x: 139, y: 89), control: CGPoint(x: 152, y: 78))
            path.addQuadCurve(to: CGPoint(x: 139, y: 89.5), control: CGPoint(x: 139, y: 89.5))
            path.addQuadCurve(to: CGPoint(x: 164, y: 85.5), control: CGPoint(x: 152, y: 78))
            
            path.move(to: CGPoint(x: 165, y: 92))
            path.addQuadCurve(to: CGPoint(x: 158, y: 86), control: CGPoint(x: 164, y: 87.5))
            path.addQuadCurve(to: CGPoint(x: 157, y: 84), control: CGPoint(x: 156, y: 83))
            path.addQuadCurve(to: CGPoint(x: 155.5, y: 85.5), control: CGPoint(x: 157, y: 83))
            path.addQuadCurve(to: CGPoint(x: 147, y: 87), control: CGPoint(x: 153, y: 85))
            path.addQuadCurve(to: CGPoint(x: 145, y: 87), control: CGPoint(x: 145, y: 88))
            path.addQuadCurve(to: CGPoint(x: 144, y: 87), control: CGPoint(x: 145, y: 88))
            path.addQuadCurve(to: CGPoint(x: 143.5, y: 90), control: CGPoint(x: 145, y: 88))
            path.addQuadCurve(to: CGPoint(x: 140, y: 94), control: CGPoint(x: 142, y: 91))
            path.addQuadCurve(to: CGPoint(x: 149, y: 104), control: CGPoint(x: 144, y: 102))
            path.addQuadCurve(to: CGPoint(x: 142, y: 95), control: CGPoint(x: 145, y: 102))
            path.addQuadCurve(to: CGPoint(x: 165, y: 92), control: CGPoint(x: 152, y: 82))
        }
    }
}

struct Eyelash_Previews: PreviewProvider {
    static var previews: some View {
        Eyelash().fill(.red)
    }
}
