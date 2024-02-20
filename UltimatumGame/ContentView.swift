//
//  ContentView.swift
//  UltimatumGame
//
//  Created by Danil Peregorodiev on 17.02.2024.
//

import SwiftUI

struct ContentView: View {
    var game = Game()
    var body: some View {
        VStack {
            Text("Hello")
                .onAppear(perform: {
                    game.playGame()
                })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
