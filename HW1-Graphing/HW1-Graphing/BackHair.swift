//
//  BackHair.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/20.
//

import Foundation
import SwiftUI

struct BackHair: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            // left
            path.move(to: CGPoint(x: 124, y: 100))
            path.addQuadCurve(to: CGPoint(x: 88, y: 177), control: CGPoint(x: 125, y: 140))
            path.addQuadCurve(to: CGPoint(x: 62, y: 226), control: CGPoint(x: 61, y: 210))
            path.addQuadCurve(to: CGPoint(x: 79, y: 256), control: CGPoint(x: 62, y: 240))
            path.addQuadCurve(to: CGPoint(x: 100, y: 258), control: CGPoint(x: 90, y: 250))
            path.addQuadCurve(to: CGPoint(x: 103, y: 251), control: CGPoint(x: 103, y: 253))
            path.addQuadCurve(to: CGPoint(x: 85.5, y: 232), control: CGPoint(x: 97, y: 243))
            path.addQuadCurve(to: CGPoint(x: 101, y: 173.5), control: CGPoint(x: 68, y: 210))
            path.addQuadCurve(to: CGPoint(x: 115, y: 157), control: CGPoint(x: 108, y: 165))
            path.addQuadCurve(to: CGPoint(x: 128.5, y: 119), control: CGPoint(x: 127, y: 140))
            path.addQuadCurve(to: CGPoint(x: 102, y: 185), control: CGPoint(x: 129, y: 145))
            path.addQuadCurve(to: CGPoint(x: 102, y: 185), control: CGPoint(x: 129, y: 145))
            path.addQuadCurve(to: CGPoint(x: 91, y: 216), control: CGPoint(x: 92, y: 200))
            path.addQuadCurve(to: CGPoint(x: 102, y: 185), control: CGPoint(x: 92, y: 200))
            path.addQuadCurve(to: CGPoint(x: 128.5, y: 119), control: CGPoint(x: 129, y: 145))
            path.addQuadCurve(to: CGPoint(x: 115, y: 157), control: CGPoint(x: 127, y: 140))
            path.addQuadCurve(to: CGPoint(x: 94, y: 192), control: CGPoint(x: 102, y: 180))
            path.addQuadCurve(to: CGPoint(x: 104, y: 248), control: CGPoint(x: 76, y: 224))
            path.addLine(to: CGPoint(x: 174, y: 248))
            path.addLine(to: CGPoint(x: 174, y: 100))
            path.addLine(to: CGPoint(x: 124, y: 100))
            
            // right
            path.move(to: CGPoint(x: 228, y: 100))
            path.addQuadCurve(to: CGPoint(x: 258, y: 185), control: CGPoint(x: 228, y: 140))
            path.addQuadCurve(to: CGPoint(x: 289, y: 228), control: CGPoint(x: 270, y: 200))
            path.addQuadCurve(to: CGPoint(x: 288, y: 272), control: CGPoint(x: 303, y: 254))
            path.addQuadCurve(to: CGPoint(x: 299, y: 307), control: CGPoint(x: 271, y: 298))
            path.addQuadCurve(to: CGPoint(x: 313, y: 301), control: CGPoint(x: 313, y: 310))
            path.addQuadCurve(to: CGPoint(x: 304, y: 294), control: CGPoint(x: 313, y: 292))
            path.addQuadCurve(to: CGPoint(x: 318, y: 296), control: CGPoint(x: 315, y: 290))
            path.addQuadCurve(to: CGPoint(x: 310, y: 309), control: CGPoint(x: 318, y: 305))
            path.addQuadCurve(to: CGPoint(x: 277, y: 294), control: CGPoint(x: 282, y: 321))
            path.addQuadCurve(to: CGPoint(x: 281, y: 269), control: CGPoint(x: 281, y: 270))
            path.addQuadCurve(to: CGPoint(x: 279, y: 254), control: CGPoint(x: 281, y: 260))
            path.addQuadCurve(to: CGPoint(x: 281, y: 269), control: CGPoint(x: 281, y: 260))
            path.addQuadCurve(to: CGPoint(x: 273, y: 280), control: CGPoint(x: 275, y: 277))
            path.addQuadCurve(to: CGPoint(x: 271, y: 271), control: CGPoint(x: 272, y: 273))
            path.addQuadCurve(to: CGPoint(x: 273, y: 280), control: CGPoint(x: 272, y: 273))
            path.addQuadCurve(to: CGPoint(x: 269, y: 309), control: CGPoint(x: 275, y: 294))
            path.addQuadCurve(to: CGPoint(x: 260, y: 288), control: CGPoint(x: 263, y: 298))
            path.addQuadCurve(to: CGPoint(x: 271, y: 271), control: CGPoint(x: 268, y: 280))
            path.addQuadCurve(to: CGPoint(x: 253, y: 195), control: CGPoint(x: 277, y: 236))
            path.addQuadCurve(to: CGPoint(x: 259, y: 219), control: CGPoint(x: 260, y: 215))
            path.addQuadCurve(to: CGPoint(x: 252, y: 212), control: CGPoint(x: 255, y: 215))
            path.addQuadCurve(to: CGPoint(x: 220, y: 148), control: CGPoint(x: 250, y: 190))
            path.addQuadCurve(to: CGPoint(x: 240, y: 184), control: CGPoint(x: 225, y: 161))
            path.addQuadCurve(to: CGPoint(x: 252, y: 212), control: CGPoint(x: 249, y: 200))
            path.addLine(to: CGPoint(x: 174, y: 212))
            path.addLine(to: CGPoint(x: 174, y: 100))
            path.addLine(to: CGPoint(x: 228, y: 100))
            
            // others
            path.move(to: CGPoint(x: 78, y: 282))
            path.addQuadCurve(to: CGPoint(x: 56, y: 294), control: CGPoint(x: 70, y: 293))
            path.addQuadCurve(to: CGPoint(x: 33.5, y: 282), control: CGPoint(x: 38, y: 294))
            path.addQuadCurve(to: CGPoint(x: 53, y: 300.5), control: CGPoint(x: 34, y: 298))
            path.addQuadCurve(to: CGPoint(x: 76, y: 288), control: CGPoint(x: 68, y: 300))
            path.addQuadCurve(to: CGPoint(x: 78, y: 282), control: CGPoint(x: 77, y: 285))
        }
    }
}

struct BackHair_Previews: PreviewProvider {
    static var previews: some View {
        BackHair().stroke(.red, lineWidth: 1)
    }
}
