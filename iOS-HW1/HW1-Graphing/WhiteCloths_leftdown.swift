//
//  WhiteCloths_leftdown.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/18.
//

import Foundation
import SwiftUI

struct WhiteCloths_leftdown: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 131, y: 266))
            path.addQuadCurve(to: CGPoint(x: 124, y: 266), control: CGPoint(x: 125, y: 262))
            path.addQuadCurve(to: CGPoint(x: 115.5, y: 264.5), control: CGPoint(x: 123, y: 264))
            path.addQuadCurve(to: CGPoint(x: 100, y: 259.5), control: CGPoint(x: 109, y: 256.6))
            path.addQuadCurve(to: CGPoint(x: 83, y: 254), control: CGPoint(x: 92, y: 245))
            path.addQuadCurve(to: CGPoint(x: 78, y: 265), control: CGPoint(x: 75, y: 257))
            path.addQuadCurve(to: CGPoint(x: 81, y: 276.5), control: CGPoint(x: 74, y: 271))
            path.addQuadCurve(to: CGPoint(x: 96, y: 276), control: CGPoint(x: 90, y: 279))
            path.addQuadCurve(to: CGPoint(x: 109, y: 277.5), control: CGPoint(x: 101, y: 281))
            path.addQuadCurve(to: CGPoint(x: 96, y: 276), control: CGPoint(x: 101, y: 281))
            path.addQuadCurve(to: CGPoint(x: 81, y: 276.5), control: CGPoint(x: 90, y: 279))
            path.addQuadCurve(to: CGPoint(x: 66, y: 328), control: CGPoint(x: 77, y: 280))
            path.addQuadCurve(to: CGPoint(x: 70, y: 331), control: CGPoint(x: 68, y: 329))
            path.addQuadCurve(to: CGPoint(x: 82, y: 338), control: CGPoint(x: 79, y: 330))
            path.addQuadCurve(to: CGPoint(x: 70, y: 331), control: CGPoint(x: 79, y: 330))
            path.addQuadCurve(to: CGPoint(x: 66, y: 328), control: CGPoint(x: 68, y: 329))
            path.addQuadCurve(to: CGPoint(x: 58, y: 330), control: CGPoint(x: 60, y: 325))
            path.addQuadCurve(to: CGPoint(x: 53, y: 343), control: CGPoint(x: 47, y: 332))
            path.addQuadCurve(to: CGPoint(x: 61.5, y: 351.5), control: CGPoint(x: 48, y: 350))
            path.addQuadCurve(to: CGPoint(x: 76, y: 357), control: CGPoint(x: 70, y: 360))
            path.addQuadCurve(to: CGPoint(x: 131, y: 266), control: CGPoint(x: 110, y: 290))
        }
    }
}

struct WhiteCloths_leftdown_Previews: PreviewProvider {
    static var previews: some View {
        WhiteCloths_leftdown().stroke(.red, lineWidth: 1)
    }
}
