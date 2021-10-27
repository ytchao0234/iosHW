//
//  WhiteCloths_center6.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/19.
//

import Foundation
import SwiftUI

struct WhiteCloths_center6: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 76, y: 357))
            path.addQuadCurve(to: CGPoint(x: 68, y: 370), control: CGPoint(x: 70, y: 357))
            path.addQuadCurve(to: CGPoint(x: 70, y: 382), control: CGPoint(x: 66, y: 378))
            path.addQuadCurve(to: CGPoint(x: 89, y: 387), control: CGPoint(x: 73, y: 391.5))
            path.addQuadCurve(to: CGPoint(x: 105, y: 391.5), control: CGPoint(x: 93, y: 393))
            path.addQuadCurve(to: CGPoint(x: 116, y: 378), control: CGPoint(x: 112, y: 394))
            path.addQuadCurve(to: CGPoint(x: 112, y: 367), control: CGPoint(x: 120, y: 367))
            path.addQuadCurve(to: CGPoint(x: 91, y: 355), control: CGPoint(x: 103, y: 350))
            path.addQuadCurve(to: CGPoint(x: 76, y: 357), control: CGPoint(x: 82, y: 350))
            
            path.move(to: CGPoint(x: 129, y: 372))
            path.addQuadCurve(to: CGPoint(x: 119.5, y: 384), control: CGPoint(x: 120, y: 366))
            path.addQuadCurve(to: CGPoint(x: 119.5, y: 384), control: CGPoint(x: 120, y: 366))
            path.addQuadCurve(to: CGPoint(x: 122.5, y: 398.5), control: CGPoint(x: 114, y: 387))
            path.addQuadCurve(to: CGPoint(x: 136, y: 402.5), control: CGPoint(x: 123, y: 401))
            path.addQuadCurve(to: CGPoint(x: 156, y: 404.7), control: CGPoint(x: 149, y: 409))
            path.addQuadCurve(to: CGPoint(x: 189.5, y: 405.2), control: CGPoint(x: 172, y: 416.5))
            path.addQuadCurve(to: CGPoint(x: 207, y: 407.2), control: CGPoint(x: 198, y: 411))
            path.addQuadCurve(to: CGPoint(x: 227.5, y: 395.5), control: CGPoint(x: 223, y: 405.5))
            path.addQuadCurve(to: CGPoint(x: 225.5, y: 377.5), control: CGPoint(x: 235.2, y: 388))
            path.addQuadCurve(to: CGPoint(x: 218, y: 371.5), control: CGPoint(x: 227, y: 372))
            path.addQuadCurve(to: CGPoint(x: 191, y: 375.2), control: CGPoint(x: 210, y: 365))
            path.addQuadCurve(to: CGPoint(x: 182, y: 377.5), control: CGPoint(x: 187, y: 375))
            path.addQuadCurve(to: CGPoint(x: 156.5, y: 371.7), control: CGPoint(x: 166, y: 369))
            path.addQuadCurve(to: CGPoint(x: 129, y: 372), control: CGPoint(x: 140, y: 366))
            
            path.move(to: CGPoint(x: 247, y: 369))
            path.addQuadCurve(to: CGPoint(x: 230.5, y: 371.2), control: CGPoint(x: 235, y: 365))
            path.addQuadCurve(to: CGPoint(x: 234.5, y: 382.5), control: CGPoint(x: 230, y: 377))
            path.addQuadCurve(to: CGPoint(x: 244, y: 397.2), control: CGPoint(x: 233.5, y: 394))
            path.addQuadCurve(to: CGPoint(x: 259.5, y: 393.5), control: CGPoint(x: 254.5, y: 398.2))
            path.addQuadCurve(to: CGPoint(x: 279, y: 388.2), control: CGPoint(x: 268, y: 402))
            path.addQuadCurve(to: CGPoint(x: 288, y: 380), control: CGPoint(x: 285, y: 390))
            path.addQuadCurve(to: CGPoint(x: 281.5, y: 371), control: CGPoint(x: 287, y: 370))
            path.addQuadCurve(to: CGPoint(x: 267.8, y: 361.5), control: CGPoint(x: 278, y: 358))
            path.addQuadCurve(to: CGPoint(x: 247, y: 369), control: CGPoint(x: 257, y: 358.5))
        }
    }
}

struct WhiteCloths_center6_Previews: PreviewProvider {
    static var previews: some View {
        WhiteCloths_center6().stroke(.red, lineWidth: 1)
    }
}
