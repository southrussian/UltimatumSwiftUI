//
//  SimulationView.swift
//  UltimatumGame
//
//  Created by Danil Peregorodiev on 21.02.2024.
//

import SwiftUI
import Charts

struct SimulationView: View {
    @ObservedObject var game = Game()
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                Button("Start the simulation", action: {game.playGame()})
//                Button("Clear", action: {game.clearGame()})
                Divider()
                Text("Nash table")
                HStack(spacing: 14) {
                    
                    Text("\(self.game.nash ?? 0.0)")
                        .bold()
                    Text("\(1.0 - (self.game.nash ?? 0.0))")
                        .bold()
                    Text("Count of true: \(self.countTrue())")
                    Text("Count of false: \(self.countFalse())")
                } // заменить на таблицу
                Divider()
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
                
            }
            .padding(.top, 18)
            .padding(.horizontal, 14)
        }
//        
//        Chart()
    }
}

#Preview {
    SimulationView()
}

extension SimulationView {
    func countTrue() -> Int {
            return self.game.history.reduce(0) { result, round in
                return round.2 ? result + 1 : result
            }
        }
        
        func countFalse() -> Int {
            return self.game.history.reduce(0) { result, round in
                return !round.2 ? result + 1 : result
            }
        }
}

//struct NashData {
//    var nash: 
//}
