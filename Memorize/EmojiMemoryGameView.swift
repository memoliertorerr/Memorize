//
//  EmojiMemoryGameView.swift
//  Memorize
//~
//  Created by Mehmet Ali Ertorer on 7.02.2025.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame
    let emojis: Array<String> = ["👻", "🎃", "🕷️", "😈", "🍭", "🍬", "🍫", "🍎", "💀", "🧟", "🧛🏻", "🐈‍⬛"]
    @State var cardCount: Int = 4
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65)), GridItem(.adaptive(minimum: 65)), GridItem(.adaptive(minimum: 65))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            withAnimation(.snappy) {
                isFaceUp.toggle()
            }
        }
    }
}


#Preview {
    EmojiMemoryGameView()
}
