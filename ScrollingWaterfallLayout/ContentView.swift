//
//  ContentView.swift
//  ScrollingWaterfallLayout
//
//  Created by Ramill Ibragimov on 12.12.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                HStack(spacing: 16) {
                    VStack {
                        ForEach(Array(leftCards.enumerated()), id: \.element) { offset, card in
                            CardView(card: card)
                                .frame(height: offset % 2 == 0 ? 320 : 200)
                        }
                    }
                    VStack {
                        ForEach(Array(rightCards.enumerated()), id: \.element) { offset, card in
                            CardView(card: card)
                                .frame(height: offset % 2 != 0 ? 320 : 200)
                        }
                    }
                }.padding()
            }.navigationTitle("People")
        }
    }
}

struct Card: Hashable {
    let title: String
    let imageName: String
}

let leftCards: [Card] = [
    Card(title: "Mark", imageName: "1"),
    Card(title: "Ebbi", imageName: "2"),
    Card(title: "Ema", imageName: "3"),
    Card(title: "Markus", imageName: "4"),
]

let rightCards: [Card] = [
    Card(title: "Lorrie", imageName: "5"),
    Card(title: "Anna", imageName: "6"),
    Card(title: "Tailor", imageName: "7"),
    Card(title: "Klare", imageName: "8"),
]

struct CardView : View {
    let card: Card
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image(card.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .clipped()
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.gray.opacity(0.6)]), startPoint: .top, endPoint: .bottom)))
                VStack {
                    Spacer()
                    Text(card.title.uppercased())
                        .font(.title3)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding()
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
