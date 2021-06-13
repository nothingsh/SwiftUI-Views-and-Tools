//
//  HexagonCard.swift
//  Rememoji
//
//  Created by Steven Zhang on 5/13/21.
//

import SwiftUI

struct Hexagon: Shape {
    let segments: [Segment] = [
        Segment(
            line: CGPoint(x: 0.4, y: 0.05),
            curve: CGPoint(x: 0.6, y: 0.05),
            control: CGPoint(x: 0.50, y: 0.00)
        ),
        Segment(
            line: CGPoint(x: 0.90, y: 0.20),
            curve: CGPoint(x: 1.00, y: 0.30),
            control: CGPoint(x: 1.00, y: 0.25)
        ),
        Segment(
            line: CGPoint(x: 1.00, y: 0.70),
            curve: CGPoint(x: 0.90, y: 0.80),
            control: CGPoint(x: 1.00, y: 0.75)
        ),
        Segment(
            line: CGPoint(x: 0.6, y: 0.95),
            curve: CGPoint(x: 0.4, y: 0.95),
            control: CGPoint(x: 0.50, y: 1.00)
        ),
        Segment(
            line: CGPoint(x: 0.10, y: 0.80),
            curve: CGPoint(x: 0.00, y: 0.70),
            control: CGPoint(x: 0.00, y: 0.75)
        ),
        Segment(
            line: CGPoint(x: 0.00, y: 0.30),
            curve: CGPoint(x: 0.10, y: 0.20),
            control: CGPoint(x: 0.00, y: 0.25)
        )
    ]
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.width*0.10, y: rect.height*0.20))
            
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

// MARK: - Preview
struct HexagonCard: View {
    var gradient: Gradient = Gradient(colors: [Color.purple, Color.blue])
    var lineWidth: CGFloat
    var strokeColor: Color
    
    var body: some View {
        Hexagon()
            .stroke(strokeColor, lineWidth: lineWidth)
            .background(Hexagon().fill(LinearGradient(gradient: gradient, startPoint: UnitPoint(x: 0.6, y: 0), endPoint: UnitPoint(x: 0.8, y: 0.8))))
            .aspectRatio(1, contentMode: .fit)
    }
}

struct HexagonCard_Previews: PreviewProvider {
    static var previews: some View {
        HexagonCard(lineWidth: 3, strokeColor: .purple)
    }
}
