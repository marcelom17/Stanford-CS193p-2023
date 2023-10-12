//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Marcelo Macedo on 12/10/2023.
//

import Foundation

struct MemorizeGame<CardContent> { //CardContent is a generic
    var cards: Array<Card>
    
    func choose(card: Card){
        
    }
    //score here too
    //func score(value: Int){}
    
    struct Card{
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
    
}
