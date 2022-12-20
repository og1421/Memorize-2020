//
//  EmojiMemoryGame.swift
//  Memorize 2020
//
//  Created by Orlando Moraes Martins on 20/12/22.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    @Published private var gameMemory: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🕷"]
//        let numberOfPairs = Int.random(in: 2...5)
        return MemoryGame<String>(numberOfPairsOfCards: 3) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Accss to the Model
    
    var cards: Array<MemoryGame<String>.Card>{
        gameMemory.cards
    }
    
    // MARK: - Intend
    
    func choose(card: MemoryGame<String>.Card){
        gameMemory.choose(card: card)
    }
    
    func resetGame (){
        gameMemory = EmojiMemoryGame.createMemoryGame()
    }
}
