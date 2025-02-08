//
//  ContentView.swift
//  Memorize
//~
//  Created by Mehmet Ali Ertorer on 7.02.2025.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👻", "🎃", "🕷️", "😈"]
    var body: some View {
        HStack {
            ForEach(0..<4, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundStyle(.orange)
        .padding()
    }
        
}

struct CardView: View {
    let content: String
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
            withAnimation(.snappy) {
                isFaceUp.toggle()
            }
        }
    }
}


#Preview {
    ContentView()
}
