//
//  DiamondCard.swift
//  Rememoji
//
//  Created by Steven Zhang on 5/30/21.
//

import SwiftUI

struct Diamond: Shape {
    private var segments: [Segment] = [
        Segment(
            line: CGPoint(x: 0.18, y: 0.025),
            curve: CGPoint(x: 0.22, y: 0),
            control: CGPoint(x: 0.2, y: 0)
        ),
        Segment(
            line: CGPoint(x: 0.78, y: 0),
            curve: CGPoint(x: 0.82, y: 0.025),
            control: CGPoint(x: 0.8, y: 0)
        ),
        Segment(
            line: CGPoint(x: 0.98, y: 0.325),
            curve: CGPoint(x: 0.98, y: 0.375),
            control: CGPoint(x: 1, y: 0.35)
        ),
        Segment(
            line: CGPoint(x: 0.52, y: 0.97),
            curve: CGPoint(x: 0.48, y: 0.97),
            control: CGPoint(x: 0.5, y: 1)
        ),
        Segment(
            line: CGPoint(x: 0.02, y: 0.375),
            curve: CGPoint(x: 0.02, y: 0.325),
            control: CGPoint(x: 0, y: 0.35)
        )
    ]
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(
                to: CGPoint(
                    x: rect.width*0.18,
                    y: rect.height*0.025
                )
            )
            
            segments.forEach { segment in
                path.addLine(
                    to: CGPoint(
                        x: rect.width*segment.line.x,
                        y: rect.height*segment.line.y
                    )
                )
                
                path.addQuadCurve(
                    to: CGPoint(
                        x: rect.width*segment.curve.x,
                        y: rect.height*segment.curve.y
                    ),
                    control: CGPoint(
                        x: rect.width*segment.control.x,
                        y: rect.height*segment.control.y
                    )
                )
            }
            
            path.closeSubpath()
        }
    }
}

// MARK: - Preview
struct DiamondCard: View {
    var gradient: Gradient = Gradient(colors: [Color.purple, Color.blue])
    var lineWidth: CGFloat
    var strokeColor: Color
    
    var body: some View {
        Diamond()
            .stroke(strokeColor, lineWidth: lineWidth)
            .background(Diamond().fill(LinearGradient(gradient: gradient, startPoint: UnitPoint(x: 0.6, y: 0), endPoint: UnitPoint(x: 0.8, y: 0.8))))
            .aspectRatio(1, contentMode: .fit)
    }
}

struct DiamondCard_Previews: PreviewProvider {
    static var previews: some View {
        DiamondCard(lineWidth: 4, strokeColor: .green)
    }
}
