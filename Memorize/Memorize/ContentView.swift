//
//  ContentView.swift
//  Memorize
//
//  Created by Marcelo Macedo on 30/09/2023.
//

import SwiftUI

struct ContentView: View {
    let emojiFacesList = ["😇", "🥹", "😎","🙃","😀","😌","🤓","🥸","🧐","🥳","😫","🥶"] //same as Array<String> == [String]
    let emojiHandsList = ["👍","🤌","🤝","🙌","👌","👏","👎","👊","✊","🤞","✌️","🤟"]
    let emojiProfessionList = ["🕵️‍♂️","👷","👮‍♂️","👩‍⚕️","💂‍♂️","👨‍🌾","👨‍🍳","👩‍🏫","👨‍🏭","👨‍💻","👩‍⚖️","👨‍✈️"]
    
    @State var emojiChosen : [String]
    
    @State var cardCount = 4
    
    init(emojiChosen: [String], cardCount: Int = 4) {
        self.cardCount = cardCount
        self.emojiChosen = setList(list: emojiFacesList)
    }
    
    var body: some View {
        VStack (spacing: 10){
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount, id: \.self){ index in  //0..<emoji.count == emoji.indices
                CardView(content: emojiChosen[index])
                    .aspectRatio(4/3, contentMode: .fit)
            }
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
    
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
            buttonChangeType(to: emojiFacesList, sfSymbol: "face.smiling", title: "Faces")
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
    }
}

func setList(list : [String]) -> [String]{
    var returnList : [String] = []
    returnList = list + list
    returnList.shuffle()
    return returnList
    //arrays can be added with array + array then shuffle, no need to for
    
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10,2]))
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        } .onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}

#Preview {
    ContentView(emojiChosen: [""])
}
