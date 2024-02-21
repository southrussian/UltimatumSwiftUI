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
            LazyVStack(alignment: .leading, spacing: 8) {
                ForEach(game.history.indices, id: \.self) { index in
                        Text(self.game.history[index].2 ? "Round \(index + 1): Offer \(self.game.history[index].1 * 100)% accepted." : "Round \(index + 1): Offer \(self.game.history[index].1 * 100)% declined.")
                            .lineLimit(nil)
                }
            }
            .padding(.top, 20)
        }
        .navigationTitle("History")
    }
}

#Preview {
    HistoryView()
}
