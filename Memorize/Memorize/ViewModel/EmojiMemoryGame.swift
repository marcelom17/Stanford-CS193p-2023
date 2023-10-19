//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Marcelo Macedo on 12/10/2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{ //ViewModel
    private static let emojis = ["😇", "🥹", "😎","🙃","😀","😌","🤓","🥸","🧐","🥳","😫","🥶"]
    //let emojiHandsList = ["👍","🤌","🤝","🙌","👌","👏","👎","👊","✊","🤞","✌️","🤟"]
    //let emojiProfessionList = ["🕵️‍♂️","👷","👮‍♂️","👩‍⚕️","💂‍♂️","👨‍🌾","👨‍🍳","👩‍🏫","👨‍🏭","👨‍💻","👩‍⚖️","👨‍✈️"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 12){ index in
            if(emojis.indices.contains(index)){
                return emojis[index]
            } else {
                return "⁉️"
            }
        }
    }
    
    
    @Published private var model = createMemoryGame()
    
 /*   private var model = MemorizeGame(numberOfPairsOfCards: 4) { index in //instead of "index in" use $0 to say that is the first argument
            return ["😇", "🥹", "😎","🙃","😀","😌","🤓","🥸","🧐","🥳","😫","🥶"][index]
    } */
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
        
    //MARK: - Intents
    
    func shuffle(){
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
}
