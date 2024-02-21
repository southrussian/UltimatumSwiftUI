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
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(game.history.indices, id: \.self) { index in
                    Section {
                        Text(self.game.history[index].2 ? "Round \(index + 1): Offer \(self.game.history[index].1 * 100)% from \(self.game.player1.name) accepted by \(self.game.player2.name)." : "Round \(index + 1): Offer \(self.game.history[index].1 * 100)% from \(self.game.player1.name) declined by \(self.game.player2.name).")
                            .lineLimit(nil)
                        Divider()
                    }
                    .padding(.horizontal, 14)
                }
            }
            .padding(.top, 20)
        }
        .navigationTitle("History")
//        .onAppear {
//            self.game.playGame()
//        }
    }
}

#Preview {
    HistoryView()
}
