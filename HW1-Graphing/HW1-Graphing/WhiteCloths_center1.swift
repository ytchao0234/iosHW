//
//  WhiteCloths_center1.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/18.
//

import Foundation
import SwiftUI

struct WhiteCloths_center1: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 164, y: 132))
            path.addQuadCurve(to: CGPoint(x: 164, y: 136), control: CGPoint(x: 164, y: 136))
            path.addQuadCurve(to: CGPoint(x: 159, y: 131), control: CGPoint(x: 163, y: 132))
            path.addQuadCurve(to: CGPoint(x: 164, y: 136), control: CGPoint(x: 163, y: 132))
            path.addQuadCurve(to: CGPoint(x: 184, y: 136), control: CGPoint(x: 175, y: 131))
            path.addQuadCurve(to: CGPoint(x: 191, y: 133), control: CGPoint(x: 187, y: 133))
            path.addQuadCurve(to: CGPoint(x: 184, y: 136), control: CGPoint(x: 187, y: 133))
            path.addQuadCurve(to: CGPoint(x: 184, y: 132), control: CGPoint(x: 184, y: 133))
            path.addQuadCurve(to: CGPoint(x: 188, y: 131), control: CGPoint(x: 186, y: 131))
            path.addQuadCurve(to: CGPoint(x: 197, y: 130), control: CGPoint(x: 196, y: 128))
            path.addQuadCurve(to: CGPoint(x: 207.5, y: 136), control: CGPoint(x: 204, y: 128))
            path.addQuadCurve(to: CGPoint(x: 209, y: 141), control: CGPoint(x: 209, y: 137))
            path.addQuadCurve(to: CGPoint(x: 206, y: 144), control: CGPoint(x: 208, y: 146))
            path.addQuadCurve(to: CGPoint(x: 196, y: 147), control: CGPoint(x: 200, y: 144))
            path.addQuadCurve(to: CGPoint(x: 206, y: 144), control: CGPoint(x: 200, y: 144))
            path.addQuadCurve(to: CGPoint(x: 209, y: 141), control: CGPoint(x: 208, y: 146))
            path.addQuadCurve(to: CGPoint(x: 215, y: 153), control: CGPoint(x: 219, y: 142))
            path.addQuadCurve(to: CGPoint(x: 198, y: 160), control: CGPoint(x: 212, y: 160))
            path.addQuadCurve(to: CGPoint(x: 191, y: 161), control: CGPoint(x: 194, y: 162))
            path.addQuadCurve(to: CGPoint(x: 158, y: 161), control: CGPoint(x: 174, y: 158))
            path.addQuadCurve(to: CGPoint(x: 154, y: 159), control: CGPoint(x: 156, y: 160))
            path.addQuadCurve(to: CGPoint(x: 143, y: 154.5), control: CGPoint(x: 147, y: 160))
            path.addQuadCurve(to: CGPoint(x: 138, y: 155), control: CGPoint(x: 141, y: 156))
            path.addQuadCurve(to: CGPoint(x: 138, y: 148), control: CGPoint(x: 133, y: 152))
            path.addQuadCurve(to: CGPoint(x: 143.5, y: 138.5), control: CGPoint(x: 135, y: 142))
            path.addQuadCurve(to: CGPoint(x: 146, y: 143), control: CGPoint(x: 141, y: 141))
            path.addQuadCurve(to: CGPoint(x: 156, y: 149), control: CGPoint(x: 150, y: 150))
            path.addQuadCurve(to: CGPoint(x: 146, y: 143), control: CGPoint(x: 150, y: 150))
            path.addQuadCurve(to: CGPoint(x: 143.5, y: 138.5), control: CGPoint(x: 141, y: 141))
            path.addQuadCurve(to: CGPoint(x: 153, y: 130.5), control: CGPoint(x: 145, y: 125))
            path.addQuadCurve(to: CGPoint(x: 164, y: 132), control: CGPoint(x: 160, y: 126))
        }
    }
}

struct WhiteCloths_center1_Previews: PreviewProvider {
    static var previews: some View {
        WhiteCloths_center1().stroke(.red, lineWidth: 1)
    }
}
