//
//  UIHelperFunctions.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 29/11/21.
//

import Foundation
import SwiftUI

//draws the edges of a circle for certain amount of angle (in degrees)
struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)

        return path
    }
}
