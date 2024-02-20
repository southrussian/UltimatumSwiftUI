//
//  SimulationView.swift
//  UltimatumGame
//
//  Created by Artem Isakov on 20.02.2024.
//

import SwiftUI

struct SimulationView: View {
    var game = Game(rounds: 100)
    var body: some View {
        Button("Start", action: {game.playGame()})
    }
}

#Preview {
    SimulationView()
}
