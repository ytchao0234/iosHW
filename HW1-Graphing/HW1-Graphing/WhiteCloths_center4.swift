//
//  WhiteCloths_center4.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/18.
//

import Foundation
import SwiftUI

struct WhiteCloths_center4: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 133, y: 190))
            path.addQuadCurve(to: CGPoint(x: 141, y: 238), control: CGPoint(x: 119, y: 221))
            path.addQuadCurve(to: CGPoint(x: 175, y: 235.2), control: CGPoint(x: 151, y: 243))
            path.addQuadCurve(to: CGPoint(x: 209, y: 239), control: CGPoint(x: 200, y: 244))
            path.addQuadCurve(to: CGPoint(x: 217, y: 190), control: CGPoint(x: 229, y: 221))
            path.addQuadCurve(to: CGPoint(x: 133, y: 190), control: CGPoint(x: 180, y: 190))
        }
    }
}

struct WhiteCloths_center4_Previews: PreviewProvider {
    static var previews: some View {
        WhiteCloths_center4().stroke(.red, lineWidth: 1)
    }
}
