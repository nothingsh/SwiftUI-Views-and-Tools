//
//  Diamond.swift
//  Rememoji
//
//  Created by Steven Zhang on 5/24/21.
//

import SwiftUI

struct SquareCard: View {
    var gradient: Gradient = Gradient(colors: [Color.purple, Color.blue])
    var lineWidth: CGFloat
    var strokeColor: Color
    
    var body: some View {
        Square()
            .stroke(strokeColor, lineWidth: lineWidth)
            .background(Square().fill(LinearGradient(gradient: gradient, startPoint: UnitPoint(x: 0.6, y: 0), endPoint: UnitPoint(x: 0.8, y: 0.8))))
            .aspectRatio(1, contentMode: .fit)
    }
}

struct Square: Shape {
    private let segments: [Segment] = [
        Segment(
            line: CGPoint(x: 0.45, y: 0.05),
            curve: CGPoint(x: 0.55, y: 0.05),
            control: CGPoint(x: 0.5, y: 0)
        ),
        Segment(
            line: CGPoint(x: 0.95, y: 0.45),
            curve: CGPoint(x: 0.95, y: 0.55),
            control: CGPoint(x: 1, y: 0.5)
        ),
        Segment(
            line: CGPoint(x: 0.55, y: 0.95),
            curve: CGPoint(x: 0.45, y: 0.95),
            control: CGPoint(x: 0.5, y: 1)
        ),
        Segment(
            line: CGPoint(x: 0.05, y: 0.55),
            curve: CGPoint(x: 0.05, y: 0.45),
            control: CGPoint(x: 0, y: 0.5)
        )
    ]
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(
                to: CGPoint(
                    x: rect.width * 0.05,
                    y: rect.height * 0.45
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

struct SquareCard_Previews: PreviewProvider {
    static var previews: some View {
        SquareCard(lineWidth: 5, strokeColor: .green)
    }
}
