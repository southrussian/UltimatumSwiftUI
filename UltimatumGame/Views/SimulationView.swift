//
//  SimulationView.swift
//  UltimatumGame
//
//  Created by Danil Peregorodiev on 21.02.2024.
//

import SwiftUI
import Charts

struct SimulationView: View {
    @EnvironmentObject var game: Game
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                HStack(spacing: 14) {
                    Button("Start the simulation", action: {game.playGame()})
                }
                Divider()
                Text("Nash table")
                LazyHStack(spacing: 14) {
                    
                    Text("\(self.game.nash ?? 0.0)")
                        .bold()
                    Text("\(1.0 - (self.game.nash ?? 0.0))")
                        .bold()
                    Text("Count of true: \(self.countTrue())")
                    Text("Count of false: \(self.countFalse())")
                } // заменить на таблицу
                Divider()
                ChartView()
                    .padding(.top, 14)
            }
            .padding(.top, 18)
            .padding(.horizontal, 14)
        }
        .navigationTitle("Simulation")
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
