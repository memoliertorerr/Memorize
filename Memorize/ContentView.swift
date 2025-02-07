//
//  ContentView.swift
//  Memorize
//~
//  Created by Mehmet Ali Ertorer on 7.02.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(content: "🚗", isFaceUp: true)
            CardView(content: "🚕")
            CardView(content: "🚙")
        }
        .foregroundStyle(.orange)
        .padding()
    }
        
}

struct CardView: View {
    var content: String
    @State var isFaceUp = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


#Preview {
    ContentView()
}
