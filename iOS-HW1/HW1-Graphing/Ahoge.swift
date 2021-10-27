//
//  Ahoge.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/14.
//

import Foundation
import SwiftUI

struct Ahoge: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 178, y: 23))
            path.addQuadCurve(to: CGPoint(x: 187, y: 13), control: CGPoint(x: 185, y: 21))
            path.addQuadCurve(to: CGPoint(x: 176, y: 3), control: CGPoint(x: 186, y: 4))
            path.addQuadCurve(to: CGPoint(x: 189, y: 15), control: CGPoint(x: 190, y: 4))
            path.addQuadCurve(to: CGPoint(x: 178, y: 23), control: CGPoint(x: 187, y: 24))
        }
    }
}

struct Ahoge_Previews: PreviewProvider {
    static var previews: some View {
        Ahoge().stroke(.red, lineWidth: 1)
    }
}
