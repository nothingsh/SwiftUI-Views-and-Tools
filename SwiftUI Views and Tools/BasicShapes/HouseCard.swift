//
//  HouseCard.swift
//  Rememoji
//
//  Created by Steven Zhang on 5/13/21.
//

import SwiftUI

struct House: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0.2*rect.width, y: 0.6*rect.height))
            
            path.addLine(to: CGPoint(x: 0.08*rect.width, y: 0.60*rect.height))
            path.addQuadCurve(
                to: CGPoint(x: 0.04*rect.width, y: 0.54*rect.height),
                control: CGPoint(x: 0.00*rect.width, y: 0.60*rect.height)
            )
            path.addLine(to: CGPoint(x: 0.45*rect.width, y: 0.05*rect.height))
            path.addQuadCurve(
                to: CGPoint(x: 0.55*rect.width, y: 0.05*rect.height),
                control: CGPoint(x: 0.5*rect.width, y: 0.0*rect.height)
            )
            
            path.addLine(to: CGPoint(x: 0.65*rect.width, y: 0.18*rect.height))
            path.addLine(to: CGPoint(x: 0.65*rect.width, y: 0.1*rect.height))
            path.addLine(to: CGPoint(x: 0.8*rect.width, y: 0.1*rect.height))
            path.addLine(to: CGPoint(x: 0.8*rect.width, y: 0.3*rect.height))
            
            path.addLine(to: CGPoint(x: 0.96*rect.width, y: 0.54*rect.height))
            path.addQuadCurve(
                to: CGPoint(x: 0.92*rect.width, y: 0.6*rect.height),
                control: CGPoint(x: 1*rect.width, y: 0.6*rect.height)
            )
            path.addLine(to: CGPoint(x: 0.8*rect.width, y: 0.6*rect.height))
            path.addLine(to: CGPoint(x: 0.8*rect.height , y: 0.95*rect.width))
            path.addQuadCurve(
                to: CGPoint(x: 0.75*rect.width, y: 1.0*rect.height),
                control: CGPoint(x: 0.8*rect.width, y: 1.0*rect.height)
            )
            path.addLine(to: CGPoint(x: 0.25*rect.width, y: 1.0*rect.height))
            path.addQuadCurve(
                to: CGPoint(x: 0.2*rect.width, y: 0.95*rect.height),
                control: CGPoint(x: 0.2*rect.width, y: 1.0*rect.height)
            )
            
            path.closeSubpath()
        }
    }
    
}


// MARK: - Preview
struct HouseCard: View {
    var gradient: Gradient = Gradient(colors: [Color.purple, Color.blue])
    var lineWidth: CGFloat
    var strokeColor: Color
    
    var body: some View {
        House()
            .stroke(strokeColor, lineWidth: lineWidth)
            .background(House().fill(LinearGradient(gradient: gradient, startPoint: UnitPoint(x: 0.6, y: 0), endPoint: UnitPoint(x: 0.8, y: 0.8))))
            .aspectRatio(1, contentMode: .fit)
    }
}

struct HouseCard_Previews: PreviewProvider {
    static var previews: some View {
        HouseCard(lineWidth: 3, strokeColor: .green)
    }
}
