//
//  Bowtie.swift
//  HW1-Graphing
//
//  Created by Hannn on 2021/10/20.
//

import Foundation
import SwiftUI

struct Bowtie: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 155, y: 149))
            path.addQuadCurve(to: CGPoint(x: 159, y: 151.5), control: CGPoint(x: 156, y: 148))
            path.addQuadCurve(to: CGPoint(x: 167, y: 154.5), control: CGPoint(x: 161, y: 149.5))
            path.addQuadCurve(to: CGPoint(x: 170, y: 156), control: CGPoint(x: 169, y: 156))
            path.addQuadCurve(to: CGPoint(x: 169.5, y: 157), control: CGPoint(x: 169.5, y: 157))
            path.addQuadCurve(to: CGPoint(x: 156.5, y: 155), control: CGPoint(x: 162, y: 153))
            path.addQuadCurve(to: CGPoint(x: 162, y: 167), control: CGPoint(x: 156, y: 160))
            path.addQuadCurve(to: CGPoint(x: 169.5, y: 160), control: CGPoint(x: 164, y: 163))
            path.addQuadCurve(to: CGPoint(x: 180.5, y: 160.5), control: CGPoint(x: 174, y: 168))
            path.addQuadCurve(to: CGPoint(x: 188.5, y: 167), control: CGPoint(x: 186, y: 164))
            path.addQuadCurve(to: CGPoint(x: 193.5, y: 155), control: CGPoint(x: 191, y: 164))
            path.addQuadCurve(to: CGPoint(x: 180.5, y: 157), control: CGPoint(x: 187, y: 154))
            path.addQuadCurve(to: CGPoint(x: 180.5, y: 156), control: CGPoint(x: 180.5, y: 156))
            path.addQuadCurve(to: CGPoint(x: 185, y: 154), control: CGPoint(x: 180, y: 156))
            path.addQuadCurve(to: CGPoint(x: 194, y: 151), control: CGPoint(x: 192, y: 151))
            path.addQuadCurve(to: CGPoint(x: 197, y: 146), control: CGPoint(x: 194, y: 149))
            path.addQuadCurve(to: CGPoint(x: 186.5, y: 149.5), control: CGPoint(x: 191, y: 151))
            path.addQuadCurve(to: CGPoint(x: 175, y: 152), control: CGPoint(x: 182, y: 156))
            path.addQuadCurve(to: CGPoint(x: 166, y: 150.5), control: CGPoint(x: 168, y: 155))
            path.addQuadCurve(to: CGPoint(x: 159.5, y: 147.5), control: CGPoint(x: 161, y: 151))
            path.addQuadCurve(to: CGPoint(x: 155, y: 149), control: CGPoint(x: 158, y: 149))
        }
    }
}

struct Bowtie_Previews: PreviewProvider {
    static var previews: some View {
        Bowtie().stroke(.red, lineWidth: 1)
    }
}
