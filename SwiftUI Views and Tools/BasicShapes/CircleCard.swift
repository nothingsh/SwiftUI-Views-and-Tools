//
//  CircleCard.swift
//  Rememoji
//
//  Created by Steven Zhang on 5/13/21.
//

import SwiftUI

struct CircleCard: View {
    var gradient: Gradient = Gradient(colors: [Color.purple, Color.blue])
    var lineWidth: CGFloat
    var strokeColor: Color
    
    var body: some View {
        Circle()
            .stroke(strokeColor, lineWidth: lineWidth)
            .background(Circle().fill(RadialGradient(gradient: gradient, center: .center, startRadius: 50, endRadius: 500)))
            .aspectRatio(1, contentMode: .fit)
    }
}

struct CircleCard_Previews: PreviewProvider {
    static var previews: some View {
        CircleCard(lineWidth: 3, strokeColor: .yellow)
    }
}
