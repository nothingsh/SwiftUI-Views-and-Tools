//
//  TriangleCard.swift
//  Rememoji
//
//  Created by Steven Zhang on 5/13/21.
//

import SwiftUI

struct TriangleCard: View {
    var gradient: Gradient = Gradient(colors: [Color.purple, Color.blue])
    var lineWidth: CGFloat
    var oritation: TriangleOritation = .north
    var strokeColor: Color
    
    var body: some View {
        Triangle()
            .rotation(Angle(degrees: oritation.rawValue))
            .stroke(strokeColor, lineWidth: lineWidth)
            .background(Triangle().fill(LinearGradient(gradient: gradient, startPoint: UnitPoint(x: 0.6, y: 0), endPoint: UnitPoint(x: 0.8, y: 0.8))))
            .aspectRatio(1, contentMode: .fit)
    }
    
    enum TriangleOritation: Double {
        case north = 0
        case west = -90
        case south = -180
        case east = -270
    }
}

struct Triangle: Shape {
    let segments: [Segment] = [
        Segment(
            line: CGPoint(x: 0.45, y: 0.08),
            curve: CGPoint(x: 0.55, y: 0.08),
            control: CGPoint(x: 0.50, y: 0.00)
        ),
        Segment(
            line: CGPoint(x: 0.95, y: 0.90),
            curve: CGPoint(x: 0.90, y: 1),
            control: CGPoint(x: 1.00, y: 1.00)
        ),
        Segment(
            line: CGPoint(x: 0.10, y: 1.00),
            curve: CGPoint(x: 0.05, y: 0.90),
            control: CGPoint(x: 0.00, y: 1.00)
        )
    ]
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(
                to: CGPoint(
                    x: rect.width * 0.05,
                    y: rect.height * 0.90
                )
            )
            
            segments.forEach { segment in
                path.addLine(
                    to: CGPoint(
                        x: rect.width * segment.line.x,
                        y: rect.height * segment.line.y
                    )
                )

                path.addQuadCurve(
                    to: CGPoint(
                        x: rect.width * segment.curve.x,
                        y: rect.height * segment.curve.y
                    ),
                    control: CGPoint(
                        x: rect.width * segment.control.x,
                        y: rect.height * segment.control.y
                    )
                )
            }
        }
    }
    
}

struct TriangleCard_Previews: PreviewProvider {
    static var previews: some View {
        TriangleCard(lineWidth: 3, strokeColor: .orange)
    }
}
