//
//  ThinHairpin_Stick.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/14.
//

import Foundation
import SwiftUI

struct ThinHairpin_Stick: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addLines([
                CGPoint(x: 195, y: 59.5),
                CGPoint(x: 211.5, y: 55),
                CGPoint(x: 212, y: 57),
                CGPoint(x: 196, y: 61.5),
                CGPoint(x: 195, y: 59.5)
            ])
        }
    }
}

struct ThinHairpin_Stick_Previews: PreviewProvider {
    static var previews: some View {
        ThinHairpin_Stick().stroke(.red, lineWidth: 0.5)
    }
}
