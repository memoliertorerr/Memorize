//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Mehmet Ali Ertorer on 10.02.2025.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
