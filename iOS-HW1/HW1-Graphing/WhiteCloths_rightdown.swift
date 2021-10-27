//
//  WhiteCloths_rightdown.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/18.
//

import Foundation
import SwiftUI

struct WhiteCloths_rightdown: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 212, y: 258))
            path.addQuadCurve(to: CGPoint(x: 220, y: 246), control: CGPoint(x: 210, y: 253))
            path.addQuadCurve(to: CGPoint(x: 241, y: 239), control: CGPoint(x: 230, y: 234))
            path.addQuadCurve(to: CGPoint(x: 241, y: 239), control: CGPoint(x: 230, y: 234))
            path.addQuadCurve(to: CGPoint(x: 246, y: 240), control: CGPoint(x: 245, y: 239))
            path.addQuadCurve(to: CGPoint(x: 247, y: 245), control: CGPoint(x: 246, y: 243))
            path.addQuadCurve(to: CGPoint(x: 236, y: 250), control: CGPoint(x: 240, y: 250))
            path.addQuadCurve(to: CGPoint(x: 234, y: 260), control: CGPoint(x: 240, y: 253))
            path.addQuadCurve(to: CGPoint(x: 239.5, y: 273), control: CGPoint(x: 235, y: 266))
            path.addQuadCurve(to: CGPoint(x: 245, y: 276), control: CGPoint(x: 243, y: 272))
            path.addQuadCurve(to: CGPoint(x: 249.5, y: 276), control: CGPoint(x: 249, y: 274))
            path.addQuadCurve(to: CGPoint(x: 253, y: 272), control: CGPoint(x: 250, y: 273))
            path.addQuadCurve(to: CGPoint(x: 249.5, y: 276), control: CGPoint(x: 250, y: 273))
            path.addQuadCurve(to: CGPoint(x: 245, y: 276), control: CGPoint(x: 249, y: 274))
            path.addQuadCurve(to: CGPoint(x: 239.5, y: 273), control: CGPoint(x: 243, y: 272))
            path.addQuadCurve(to: CGPoint(x: 234, y: 260), control: CGPoint(x: 235, y: 266))
            path.addQuadCurve(to: CGPoint(x: 236, y: 250), control: CGPoint(x: 240, y: 253))
            path.addQuadCurve(to: CGPoint(x: 247, y: 245), control: CGPoint(x: 240, y: 250))
            path.addQuadCurve(to: CGPoint(x: 256, y: 252), control: CGPoint(x: 250, y: 252))
            path.addQuadCurve(to: CGPoint(x: 257, y: 257), control: CGPoint(x: 256, y: 255))
            path.addQuadCurve(to: CGPoint(x: 256, y: 252), control: CGPoint(x: 256, y: 255))
            path.addQuadCurve(to: CGPoint(x: 247, y: 245), control: CGPoint(x: 250, y: 252))
            path.addQuadCurve(to: CGPoint(x: 246, y: 240), control: CGPoint(x: 246, y: 243))
            path.addQuadCurve(to: CGPoint(x: 248, y: 237), control: CGPoint(x: 247, y: 237))
            path.addQuadCurve(to: CGPoint(x: 257, y: 223.5), control: CGPoint(x: 244, y: 227))
            path.addQuadCurve(to: CGPoint(x: 264, y: 223), control: CGPoint(x: 260, y: 221))
            path.addQuadCurve(to: CGPoint(x: 285, y: 230.5), control: CGPoint(x: 276, y: 220))
            path.addQuadCurve(to: CGPoint(x: 285, y: 238), control: CGPoint(x: 287, y: 234))
            path.addQuadCurve(to: CGPoint(x: 284.5, y: 246), control: CGPoint(x: 288, y: 243))
            path.addQuadCurve(to: CGPoint(x: 273, y: 256), control: CGPoint(x: 282, y: 256))
            path.addQuadCurve(to: CGPoint(x: 268, y: 258), control: CGPoint(x: 270, y: 258))
            path.addQuadCurve(to: CGPoint(x: 263, y: 259), control: CGPoint(x: 266, y: 259))
            path.addQuadCurve(to: CGPoint(x: 268, y: 258), control: CGPoint(x: 266, y: 259))
            path.addQuadCurve(to: CGPoint(x: 266, y: 280), control: CGPoint(x: 275, y: 268))
            path.addQuadCurve(to: CGPoint(x: 258.5, y: 288.5), control: CGPoint(x: 265, y: 285))
            path.addQuadCurve(to: CGPoint(x: 247, y: 295), control: CGPoint(x: 256, y: 296))
            path.addQuadCurve(to: CGPoint(x: 212, y: 258), control: CGPoint(x: 224, y: 280))
        }
    }
}

struct WhiteCloths_rightdown_Previews: PreviewProvider {
    static var previews: some View {
        WhiteCloths_rightdown().stroke(.red, lineWidth: 1)
    }
}

