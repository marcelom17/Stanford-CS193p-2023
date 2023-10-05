//
//  ContentView.swift
//  Memorize
//
//  Created by Marcelo Macedo on 30/09/2023.
//

import SwiftUI

struct ContentView: View {
    let emoji = ["😇", "🥹", "😎"] //same as Array<String> == [String]
    
    var body: some View {
        HStack{
            ForEach(emoji.indices, id: \.self){ index in  //0..<emoji.count
                    CardView(content: emoji[index])
            }

        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if(isFaceUp){
                base.foregroundColor(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 5, dash: [10,2]))
                Text(content)
            }
            else {
                base.fill()
            }
        } .onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}

#Preview {
    ContentView()
}
