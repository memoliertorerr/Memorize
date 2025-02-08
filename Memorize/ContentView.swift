//
//  ContentView.swift
//  Memorize
//~
//  Created by Mehmet Ali Ertorer on 7.02.2025.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👻", "🎃", "🕷️", "😈", "🍭", "🍬", "🍫", "🍎"]
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button {
            cardCount += offset
        } label: {
            Image(systemName: symbol)
        }
        .disabled(cardCount + offset > emojis.count || cardCount + offset < 1)
    }
    
    var cardRemover: some View {
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.fill.badge.plus")
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65)), GridItem(.adaptive(minimum: 65)), GridItem(.adaptive(minimum: 65))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.title)
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
    ContentView()
}
