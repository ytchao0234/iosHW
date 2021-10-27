//
//  Harp2.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/20.
//

import Foundation
import SwiftUI

struct Harp2: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 302.5, y: 120))
            path.addQuadCurve(to: CGPoint(x: 296, y: 140), control: CGPoint(x: 276, y: 130))
            path.addQuadCurve(to: CGPoint(x: 302.5, y: 120), control: CGPoint(x: 316, y: 142))
            
            path.move(to: CGPoint(x: 236, y: 317))
            path.addQuadCurve(to: CGPoint(x: 233, y: 317), control: CGPoint(x: 236, y: 314))
            path.addQuadCurve(to: CGPoint(x: 235, y: 320.5), control: CGPoint(x: 232, y: 319))
            path.addQuadCurve(to: CGPoint(x: 241, y: 322), control: CGPoint(x: 238, y: 322))
            path.addQuadCurve(to: CGPoint(x: 235, y: 320.5), control: CGPoint(x: 238, y: 322))
            path.addQuadCurve(to: CGPoint(x: 236, y: 329), control: CGPoint(x: 232, y: 323))
            path.addQuadCurve(to: CGPoint(x: 241, y: 322), control: CGPoint(x: 241, y: 327))
            path.addQuadCurve(to: CGPoint(x: 244, y: 321), control: CGPoint(x: 242, y: 322))
            path.addQuadCurve(to: CGPoint(x: 242, y: 319), control: CGPoint(x: 245, y: 318))
            path.addQuadCurve(to: CGPoint(x: 236, y: 317), control: CGPoint(x: 239, y: 320))
        }
    }
}

struct Harp2_Previews: PreviewProvider {
    static var previews: some View {
        Harp2().stroke(.red, lineWidth: 1)
    }
}
