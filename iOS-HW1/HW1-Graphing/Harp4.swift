//
//  Harp4.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/20.
//

import Foundation
import SwiftUI

struct Harp4: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addPath(
                Path(ellipseIn: CGRect(x: 228, y: 247, width: 2, height: 3))
            )
            path.addPath(
                Path(ellipseIn: CGRect(x: 249.7, y: 164.7, width: 2, height: 3))
            )
            path.addPath(
                Path(ellipseIn: CGRect(x: 230, y: 256, width: 2, height: 3))
            )
            path.addPath(
                Path(ellipseIn: CGRect(x: 256.5, y: 160, width: 2, height: 3))
            )
            path.addPath(
                Path(ellipseIn: CGRect(x: 233, y: 263, width: 2, height: 3))
            )
            path.addPath(
                Path(ellipseIn: CGRect(x: 263.5, y: 156, width: 2, height: 3))
            )
            path.addPath(
                Path(ellipseIn: CGRect(x: 236, y: 273, width: 2, height: 3))
            )
            path.addPath(
                Path(ellipseIn: CGRect(x: 271, y: 152, width: 2, height: 3))
            )
            path.addPath(
                Path(ellipseIn: CGRect(x: 238, y: 281, width: 2, height: 3))
            )
            path.addPath(
                Path(ellipseIn: CGRect(x: 278, y: 148, width: 2, height: 3))
            )
            path.addPath(
                Path(ellipseIn: CGRect(x: 241, y: 289, width: 2, height: 3))
            )
            path.move(to: CGPoint(x: 244.5, y: 175))
            path.addLine(to: CGPoint(x: 229, y: 247))
            path.move(to: CGPoint(x: 251, y: 168))
            path.addLine(to: CGPoint(x: 231, y: 256))
            path.move(to: CGPoint(x: 258, y: 163))
            path.addLine(to: CGPoint(x: 234, y: 263))
            path.move(to: CGPoint(x: 264.5, y: 159))
            path.addLine(to: CGPoint(x: 237, y: 273))
            path.move(to: CGPoint(x: 272, y: 155))
            path.addLine(to: CGPoint(x: 239, y: 281))
            path.move(to: CGPoint(x: 279, y: 151))
            path.addLine(to: CGPoint(x: 242, y: 289))
        }
    }
}

struct Harp4_Previews: PreviewProvider {
    static var previews: some View {
        Harp4().stroke(.red, lineWidth: 1)
    }
}
