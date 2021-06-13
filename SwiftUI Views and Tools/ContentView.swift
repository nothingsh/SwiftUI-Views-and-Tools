//
//  ContentView.swift
//  SwiftUI Views and Tools
//
//  Created by Steven Zhang on 3/4/21.
//

import SwiftUI

struct ContentView: View {
    var columns: [GridItem] = Array(repeating: .init(.adaptive(minimum: 200)), count: 3)
    
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
            LazyVGrid(columns: columns) {
                Diamond()
                    .aspectRatio(1, contentMode: .fit)
                    .padding()
                Heart()
                    .aspectRatio(1, contentMode: .fit)
                    .padding()
                Hexagon()
                    .aspectRatio(1, contentMode: .fit)
                    .padding()
                House()
                    .aspectRatio(1, contentMode: .fit)
                    .padding()
                Octagon()
                    .aspectRatio(1, contentMode: .fit)
                    .padding()
                Rect()
                    .aspectRatio(1, contentMode: .fit)
                    .padding()
                Shield()
                    .aspectRatio(0.8, contentMode: .fit)
                    .padding()
                Square()
                    .aspectRatio(1, contentMode: .fit)
                    .padding()
                Triangle()
                    .aspectRatio(1, contentMode: .fit)
                    .padding()
            }.tabViewStyle(PageTabViewStyle())
            .foregroundColor(.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
