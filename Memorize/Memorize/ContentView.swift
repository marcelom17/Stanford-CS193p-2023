//
//  ContentView.swift
//  Memorize
//
//  Created by Marcelo Macedo on 30/09/2023.
//

import SwiftUI

struct ContentView: View {
    let emoji = ["😇", "🥹", "😎","🙃","😀","😌","🤓","🥸","🧐","🥳","😫","🥶 "] //same as Array<String> == [String]
    @State var cardCount = 4
    var body: some View {
        VStack (spacing: 10){
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
                CardView(content: emoji[index])
                    .aspectRatio(4/3, contentMode: .fit)
            }
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
    
    var cardCountAdjusters : some View {
        HStack{
            cardRemover
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
        .disabled(cardCount + offset < 2 || cardCount + offset > emoji.count)
    }
    
    var cardRemover : some View {
        cardCountAdjuster(by: -1, symbol: "minus.square.fill")
    }
    
    var cardAdder : some View {
        return cardCountAdjuster(by: 1, symbol: "plus.square.fill")

    }
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
                Text(content)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        } .onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}

#Preview {
    ContentView()
}
