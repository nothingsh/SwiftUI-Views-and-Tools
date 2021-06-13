//
//  ShieldCard.swift
//  Rememoji
//
//  Created by Steven Zhang on 5/24/21.
//

import SwiftUI

struct ShieldCard: View {
    var gradient: Gradient = Gradient(colors: [Color.purple, Color.blue])
    var lineWidth: CGFloat
    var strokeColor: Color
    
    var body: some View {
        Shield()
            .stroke(strokeColor, lineWidth: lineWidth)
            .background(Shield().fill(LinearGradient(gradient: gradient, startPoint: UnitPoint(x: 0.6, y: 0), endPoint: UnitPoint(x: 0.8, y: 0.8))))
            .aspectRatio(0.8, contentMode: .fit)
    }
}

struct Shield: Shape {
    private let segments: [Segment] = [
        Segment(
            line: CGPoint(x: 0.5, y: 0),
            curve: CGPoint(x: 0.5, y: 0),
            control: CGPoint(x: 0.5, y: 0)
        ),
        Segment(
            line: CGPoint(x: 0.95, y: 1.0/8.0-0.02),
            curve: CGPoint(x: 1, y: 1.0/8.0+0.03),
            control: CGPoint(x: 1, y: 1.0/8.0)
        ),
        Segment(
            line: CGPoint(x: 1, y: 5.2/7.0-0.05),
            curve: CGPoint(x: 0.8, y: 5.2/7.0+0.11),
            control: CGPoint(x: 1, y: 5.2/7.0)
        ),
        Segment(
            line: CGPoint(x: 0.5, y: 1),
            curve: CGPoint(x: 0.5, y: 1),
            control: CGPoint(x: 0.5, y: 1)
        ),
        Segment(
            line: CGPoint(x: 0.2, y: 5.2/7.0+0.11),
            curve: CGPoint(x: 0, y: 5.2/7.0-0.05),
            control: CGPoint(x: 0, y: 5.2/7.0)
        ),
        Segment(
            line: CGPoint(x: 0, y: 1.0/8.0+0.03),
            curve: CGPoint(x: 0.05, y: 1.0/8.0-0.02),
            control: CGPoint(x: 0, y: 1.0/8.0)
        )
        
    ]
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(
                to: CGPoint(
                    x: rect.width * 0.05,
                    y: rect.height * (1.0/8.0-0.02)
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

            path.closeSubpath()
        }
    }
}

struct ShieldCard_Previews: PreviewProvider {
    static var previews: some View {
        ShieldCard(lineWidth: 5, strokeColor: .green)
    }
}
