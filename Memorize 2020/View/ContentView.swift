//
//  ContentView.swift
//  Memorize 2020
//
//  Created by Orlando Moraes Martins on 20/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List(landmarks) { landmark in
                NavigationLink {
                    LandMarkDetail()
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Memory Game")
//            .listStyle(GroupedListStyle())
        }
    }
}

struct PresentationGame: View {
    @ObservedObject var viewModel = EmojiMemoryGame()
    var body: some View {
        VStack{
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture{
                    withAnimation(.linear(duration: 0.2)){
                        viewModel.choose(card: card)
                    }
                    
                }
                .padding(5)
                
            }
            .padding()
            .foregroundColor(Color.orange)
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)){
                    self.viewModel.resetGame()
                }
            }, label: { Text ("New Game") })
        }
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation(){
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)){
            animatedBonusRemaining = 0
        }
    }
    
    var body: some View{
        GeometryReader { geometry in
            if card.isFaceUp || !card.isMatched{
                ZStack {
                    Group{
                        if card.isConsumingBonusTime{
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaining*360-90), clockwise: true)
                                .onAppear{
                                    self.startBonusTimeAnimation()
                                }
                        } else {
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining*360-90), clockwise: true)
                        }
                    }
                        .padding(5).opacity(0.4)
                        .transition(.identity)
                    Text(card.content)
                        .font(Font.system(size: fontSize(for: geometry.size)))
                        .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                        .animation(card.isMatched ?  Animation.linear(duration: 1).repeatCount(1) : .default)
                }
                //            .modifier(Cardify(isFaceUp: card.isFaceUp))
                .cardify(isFaceUp: card.isFaceUp)
                .transition(AnyTransition.offset(x: 10, y: -450))
            }
//                .animation(Animation .easeInOut(duration: 1).delay(1))
        }
    }
    
    // MARK: - Drawing Constants
    
    
    func fontSize (for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}
