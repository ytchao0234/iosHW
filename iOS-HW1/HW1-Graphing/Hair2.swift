//
//  'Hair2'.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/14.
//

import Foundation
import SwiftUI

struct Hair2: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 176, y: 17))
            path.addQuadCurve(to: CGPoint(x: 133.5, y: 47), control: CGPoint(x: 142, y: 16))
            path.addQuadCurve(to: CGPoint(x: 113, y: 74), control: CGPoint(x: 130, y: 60))
            path.addQuadCurve(to: CGPoint(x: 120, y: 93), control: CGPoint(x: 111, y: 80))
            path.addQuadCurve(to: CGPoint(x: 124, y: 79), control: CGPoint(x: 122, y: 85))
            path.addQuadCurve(to: CGPoint(x: 119, y: 116), control: CGPoint(x: 116, y: 104))
            path.addQuadCurve(to: CGPoint(x: 129, y: 122), control: CGPoint(x: 121, y: 123))
            path.addQuadCurve(to: CGPoint(x: 122, y: 96), control: CGPoint(x: 118, y: 122))
            path.addQuadCurve(to: CGPoint(x: 134, y: 120), control: CGPoint(x: 121, y: 119))
            path.addQuadCurve(to: CGPoint(x: 128, y: 111), control: CGPoint(x: 130, y: 116))
            path.addQuadCurve(to: CGPoint(x: 144, y: 123), control: CGPoint(x: 134, y: 123))
            path.addQuadCurve(to: CGPoint(x: 138, y: 97), control: CGPoint(x: 129, y: 119))
            path.addQuadCurve(to: CGPoint(x: 146, y: 120), control: CGPoint(x: 133, y: 119))
            path.addQuadCurve(to: CGPoint(x: 140, y: 95), control: CGPoint(x: 140, y: 114))
            path.addQuadCurve(to: CGPoint(x: 175, y: 50), control: CGPoint(x: 135, y: 50))
        }
    }
}

struct Hair2_Previews: PreviewProvider {
    static var previews: some View {
        Hair2().stroke(.red, lineWidth: 1)
    }
}
