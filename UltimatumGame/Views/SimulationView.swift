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
                            Text(self.game.history[index].2 ? "Round \(index + 1): Offer \(self.game.history[index].1 * 100)% accepted." : "Round \(index + 1): Offer \(self.game.history[index].1 * 100)% declined.")
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
