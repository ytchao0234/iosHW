//
//  Shofar_Back.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/14.
//

import Foundation
import SwiftUI

struct Shofar_Back: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 145.5, y: 26))
            path.addQuadCurve(to: CGPoint(x: 130, y: 26), control: CGPoint(x: 140, y: 20))
            path.addQuadCurve(to: CGPoint(x: 115, y: 72), control: CGPoint(x: 103, y: 43))
            path.addQuadCurve(to: CGPoint(x: 131, y: 70), control: CGPoint(x: 124, y: 87))
            path.addQuadCurve(to: CGPoint(x: 145.5, y: 26), control: CGPoint(x: 130, y: 43))
        }
    }
}

struct Shofar_Back_Previews: PreviewProvider {
    static var previews: some View {
        Shofar_Back().stroke(.red, lineWidth: 1)
    }
}
