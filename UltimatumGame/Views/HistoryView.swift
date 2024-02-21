//
//  SimulationView.swift
//  UltimatumGame
//
//  Created by Danil Peregorodiev on 21.02.2024.
//

import SwiftUI

struct HistoryView: View {
    
    @ObservedObject var game = Game()
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(game.history.indices, id: \.self) { index in
                Text(self.game.history[index].2 ? "Round \(index + 1): Offer \(self.game.history[index].1 * 100)% from \(self.game.player1.name) accepted \(self.game.player2.name)." : "Round \(index + 1): Offer \(self.game.history[index].1 * 100)% from \(self.game.player1.name) declined \(self.game.player2.name).")
                    .lineLimit(nil)
            }
        }
        .onAppear {
            self.game.playGame()
        }
    }
}

#Preview {
    HistoryView()
}
