//
//  Ear.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/14.
//

import Foundation
import SwiftUI

struct Ear: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 140, y: 95))
            path.addQuadCurve(to: CGPoint(x:120, y: 102), control: CGPoint(x:132, y: 92))
            path.addQuadCurve(to: CGPoint(x:106, y: 113), control: CGPoint(x:110, y: 115))
            path.addQuadCurve(to: CGPoint(x:124, y: 113), control: CGPoint(x: 112, y: 116))
            path.addQuadCurve(to: CGPoint(x:144, y: 110), control: CGPoint(x: 130, y: 110))
        }
    }
}

struct Ear_Previews: PreviewProvider {
    static var previews: some View {
        Ear().stroke(.red, lineWidth: 1)
    }
}
