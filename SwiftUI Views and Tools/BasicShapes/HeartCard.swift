//
//  HeartCard.swift
//  Rememoji
//
//  Created by Steven Zhang on 5/30/21.
//

import SwiftUI

struct Heart: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(
                to: CGPoint(
                    x: rect.width*0.5,
                    y: rect.height*0.22
                )
            )
            
            path.addQuadCurve(
                to: CGPoint(x: rect.width*0.95, y: rect.height*0.22),
                control: CGPoint(x: rect.width*0.8, y: rect.height*0.0)
            )
            
            path.addQuadCurve(
                to: CGPoint(x: rect.width*0.93, y: rect.height*0.5),
                control: CGPoint(x: rect.width*1.0, y: rect.height*0.3)
            )
            
            path.addQuadCurve(
                to: CGPoint(x: rect.width*0.55, y: rect.height*0.95),
                control: CGPoint(x: rect.width*0.8, y: rect.height*0.8)
            )
            
            path.addQuadCurve(
                to: CGPoint(x: rect.width*0.45, y: rect.height*0.95),
                control: CGPoint(x: rect.width*0.5, y: rect.height*0.98)
            )
            
            path.addQuadCurve(
                to: CGPoint(x: rect.width*0.07, y: rect.height*0.5),
                control: CGPoint(x: rect.width*0.2, y: rect.height*0.8)
            )
            
            path.addQuadCurve(
                to: CGPoint(x: rect.width*0.05, y: rect.height*0.22),
                control: CGPoint(x: rect.width*0.0, y: rect.height*0.3)
            )
            
            path.addQuadCurve(
                to: CGPoint(x: rect.width*0.5, y: rect.height*0.22),
                control: CGPoint(x: rect.width*0.2, y: rect.height*0.0)
            )
        }
    }
}


// MARK: - Preview
struct HeartCard: View {
    var gradient: Gradient = Gradient(colors: [Color.purple, Color.blue])
    var lineWidth: CGFloat
    var strokeColor: Color
    
    var body: some View {
        Heart()
            .stroke(strokeColor, lineWidth: lineWidth)
            .background(Heart().fill(LinearGradient(gradient: gradient, startPoint: UnitPoint(x: 0.6, y: 0), endPoint: UnitPoint(x: 0.8, y: 0.8))))
            .aspectRatio(1, contentMode: .fit)
    }
}

struct HeartCard_Previews: PreviewProvider {
    static var previews: some View {
        HeartCard(lineWidth: 5, strokeColor: .orange)
    }
}
