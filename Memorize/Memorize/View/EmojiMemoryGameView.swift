//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Marcelo Macedo on 30/09/2023.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame //@StateObject only will work for this view
    
    var body: some View {
        VStack (spacing: 10){
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                cards
            }
            Button("Shuffle"){
                viewModel.shuffle()
            }
            //Spacer()
            //cardCountAdjusters
        }
        .padding()
    }
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0){
            ForEach(viewModel.cards.indices, id: \.self){ index in  //0..<emoji.count == emoji.indices
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
    
/* // Old Code from initial lesson(buttons to change type of emoji & number os cards)
 
    var cardCountAdjusters : some View {
        HStack{
            cardRemover
            Spacer()
            changeCardType
            Spacer()
            cardAdder
        }.imageScale(.large )
    }
    
    func cardCountAdjuster(by offset: Int, symbol:  String) -> some View {
        Button(action: {
             cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 4 || cardCount + offset > emojiChosen.count)
    }
    
    var cardRemover : some View {
        cardCountAdjuster(by: -1, symbol: "minus.square.fill")
    }
    
    var cardAdder : some View {
        return cardCountAdjuster(by: 1, symbol: "plus.square.fill")

    }
    
    var changeCardType : some View {
        HStack(spacing: 30){
            buttonChangeType(to: emojiHandsList, sfSymbol: "face.smiling", title: "Faces")
            buttonChangeType(to: emojiHandsList, sfSymbol: "hands.and.sparkles.fill", title: "Hands")
            buttonChangeType(to: emojiProfessionList, sfSymbol: "person.fill", title: "Workers")
        }
    }
    
    
    
    func buttonChangeType(to list : [String], sfSymbol : String, title : String) -> some View {
        Button(action: {
            emojiChosen = setList(list: list)
        }, label: {
            VStack{
                Image(systemName: sfSymbol).font(.title3)
                Text(title)
            }
        })
    } */
}
/*
func setList(list : [String]) -> [String]{
    var returnList : [String] = []
    returnList = list + list
    returnList.shuffle()
    return returnList
    //arrays can be added with array + array then shuffle, no need to for
} */

struct CardView: View {
    let card : MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10,2]))
                Text(card.content)
                    .font(.system(size: 100))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
                .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
