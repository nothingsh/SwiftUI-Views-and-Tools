//
//  SquareCard.swift
//  Rememoji
//
//  Created by Steven Zhang on 5/13/21.
//

import SwiftUI

struct RectCard: View {
    var gradient: Gradient = Gradient(colors: [Color.purple, Color.blue])
    var lineWidth: CGFloat
    var strokeColor: Color
    
    var body: some View {
        Rect()
            .stroke(strokeColor, lineWidth: lineWidth)
            .background(Rect().fill(LinearGradient(gradient: gradient, startPoint: UnitPoint(x: 0.6, y: 0), endPoint: UnitPoint(x: 0.8, y: 0.8))))
            .aspectRatio(1, contentMode: .fit)
    }
}

struct Rect: Shape {
    private let segments: [Segment] = [
        Segment(
            line: CGPoint(x: 0.00, y: 0.05),
            curve: CGPoint(x: 0.05, y: 0.00),
            control: CGPoint(x: 0.00, y: 0.00)
        ),
        Segment(
            line: CGPoint(x: 0.95, y: 0.00),
            curve: CGPoint(x: 1.00, y: 0.05),
            control: CGPoint(x: 1.00, y: 0.00)
        ),
        Segment(
            line: CGPoint(x: 1.00, y: 0.95),
            curve: CGPoint(x: 0.95, y: 1.00),
            control: CGPoint(x: 1.00, y: 1.00)
        ),
        Segment(
            line: CGPoint(x: 0.05, y: 1.00),
            curve: CGPoint(x: 0.00, y: 0.95),
            control: CGPoint(x: 0.00, y: 1.00)
        )
    ]
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(
                to: CGPoint(
                    x: rect.width * 0.00,
                    y: rect.height * 0.95
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

struct RectCard_Previews: PreviewProvider {
    static var previews: some View {
        SquareCard(lineWidth: 3, strokeColor: .red)
    }
}
