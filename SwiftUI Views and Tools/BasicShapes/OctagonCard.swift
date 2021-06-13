//
//  OctagonCard.swift
//  Rememoji
//
//  Created by Steven Zhang on 5/24/21.
//

import SwiftUI

struct Octagon: Shape {
    private let segments: [Segment] = [
        Segment(
            line: CGPoint(x: 0.73, y: 0),
            curve: CGPoint(x: 0.78, y: 0.03),
            control: CGPoint(x: 0.75, y: 0)
        ),
        Segment(
            line: CGPoint(x: 0.97, y: 0.22),
            curve: CGPoint(x: 1, y: 0.27),
            control: CGPoint(x: 1, y: 0.25)
        ),
        Segment(
            line: CGPoint(x: 1, y: 0.73),
            curve: CGPoint(x: 0.97, y: 0.77),
            control: CGPoint(x: 1, y: 0.75)
        ),
        Segment(
            line: CGPoint(x: 0.78, y: 0.97),
            curve: CGPoint(x: 0.73, y: 1),
            control: CGPoint(x: 0.75, y: 1)
        ),
        Segment(
            line: CGPoint(x: 0.27, y: 1),
            curve: CGPoint(x: 0.22, y: 0.97),
            control: CGPoint(x: 0.25, y: 1)
        ),
        Segment(
            line: CGPoint(x: 0.03, y: 0.78),
            curve: CGPoint(x: 0, y: 0.73),
            control: CGPoint(x: 0, y: 0.75)
        ),
        Segment(
            line: CGPoint(x: 0, y: 0.27),
            curve: CGPoint(x: 0.03, y: 0.22),
            control: CGPoint(x: 0, y: 0.25)
        ),
        Segment(
            line: CGPoint(x: 0.22, y: 0.03),
            curve: CGPoint(x: 0.27, y: 0),
            control: CGPoint(x: 0.25, y: 0)
        )
    ]
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(
                to: CGPoint(
                    x: rect.width*0.27,
                    y: rect.height*0
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
        }
    }
    
    
}

// MARK: - Preview
struct OctagonCard: View {
    var gradient: Gradient = Gradient(colors: [Color.purple, Color.blue])
    var lineWidth: CGFloat
    var strokeColor: Color
    
    var body: some View {
        Octagon()
            .stroke(strokeColor, lineWidth: lineWidth)
            .background(Octagon().fill(LinearGradient(gradient: gradient, startPoint: UnitPoint(x: 0.6, y: 0), endPoint: UnitPoint(x: 0.8, y: 0.8))))
            .aspectRatio(1, contentMode: .fit)
    }
}

struct OctagonCard_Previews: PreviewProvider {
    static var previews: some View {
        OctagonCard(lineWidth: 5, strokeColor: .green)
    }
}
