//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Marcelo Macedo on 30/09/2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
