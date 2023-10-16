//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Marcelo Macedo on 12/10/2023.
//

import Foundation

struct MemoryGame<CardContent> { //CardContent is a generic
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = [] //empty literal array
        for index in 0 ..< max(2, numberOfPairsOfCards){ //needs 2 pairs
            let content: CardContent = cardContentFactory(index)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card){
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    //score here too
    //func score(value: Int){}
    
    struct Card{
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
    
    
    
}
