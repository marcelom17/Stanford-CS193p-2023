//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Marcelo Macedo on 12/10/2023.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable { //CardContent is a generic
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = [] //empty literal array
        for index in 0 ..< max(2, numberOfPairsOfCards){ //needs 2 pairs
            let content: CardContent = cardContentFactory(index)
            cards.append(Card(content: content, id: "\(index+1)a"))
            cards.append(Card(content: content, id: "\(index+1)b"))
        }
    }
    
    //MARK: - Game Login
    
    var indexOfFaceUpCard: Int? {  //Computed Property
        get{
            return cards.indices.filter{ index in cards[index].isFaceUp }.only //the .only is an extension below
        } set {
            cards.indices.forEach{ cards[$0].isFaceUp = (newValue == $0) } //if is newValue set faceUp True else false
        }
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }){ //same as run index on a for loop as Int?
            if(!cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched){
                if let potentialMatchIndex = indexOfFaceUpCard{
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                } else {
                    indexOfFaceUpCard = chosenIndex //will do the set inside var
                }
                cards[chosenIndex].isFaceUp = true

            }
            
        }
    }
    
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    }
    
    //score here too
    //func score(value: Int){}
    
//MARK: -
    
    struct Card : Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        var id: String
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
    }
}

//MARK: - Extensions

extension Array{
    var only: Element?{
        return count == 1 ? first : nil
    }
    //TODO: Add .firstIndex() from choose here, could be used for all type of Identifiable Arrays
}
