//
//  WhiteCloths_center5.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/19.
//

import Foundation
import SwiftUI

struct WhiteCloths_center5: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 139.5, y: 251))
            path.addQuadCurve(to: CGPoint(x: 136.2, y: 260.5), control: CGPoint(x: 139, y: 253))
            path.addQuadCurve(to: CGPoint(x: 76, y: 357), control: CGPoint(x: 90, y: 305))
            path.addQuadCurve(to: CGPoint(x: 117.5, y: 369), control: CGPoint(x: 100, y: 370))
            path.addQuadCurve(to: CGPoint(x: 129.5, y: 331), control: CGPoint(x: 121, y: 353))
            path.addQuadCurve(to: CGPoint(x: 122, y: 371.5), control: CGPoint(x: 125, y: 353))
            path.addQuadCurve(to: CGPoint(x: 225, y: 374), control: CGPoint(x: 174, y: 390))
            path.addQuadCurve(to: CGPoint(x: 221, y: 332), control: CGPoint(x: 223, y: 357))
            path.addQuadCurve(to: CGPoint(x: 231.5, y: 370), control: CGPoint(x: 225, y: 354))
            path.addQuadCurve(to: CGPoint(x: 275, y: 362), control: CGPoint(x: 250, y: 373))
            path.addQuadCurve(to: CGPoint(x: 212.5, y: 260.5), control: CGPoint(x: 259, y: 305))
            path.addQuadCurve(to: CGPoint(x: 209, y: 250), control: CGPoint(x: 209, y: 253))
            path.addQuadCurve(to: CGPoint(x: 209, y: 250), control: CGPoint(x: 209, y: 253))
            path.addQuadCurve(to: CGPoint(x: 175, y: 242.5), control: CGPoint(x: 190, y: 245))
            path.addQuadCurve(to: CGPoint(x: 139.5, y: 251), control: CGPoint(x: 157, y: 245))
        }
    }
}

struct WhiteCloths_center5_Previews: PreviewProvider {
    static var previews: some View {
        WhiteCloths_center5().stroke(.red, lineWidth: 1)
    }
}
