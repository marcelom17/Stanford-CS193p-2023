//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Marcelo Macedo on 12/10/2023.
//

import SwiftUI

class EmojiMemoryGame { //ViewModel
    var model: MemorizeGame<String> //here need to set the generic type.
    
    init(model: MemorizeGame<String>) {
        self.model = model
    }
}
