//
//  Player.swift
//  UltimatumGame
//
//  Created by Danil Peregorodiev on 17.02.2024.
//

import Foundation

class Player {
    
    let strategy: Double
    let name: String
    let acceptance_threshold: Double
    
    init(name: String, strategy: Double, acceptance_threshold: Double) {
        self.name = name
        self.strategy = 0.5
        self.acceptance_threshold = 0.5
    }
    
    func make_offer() -> Double {
        return max(0, min(1, self.strategy + Double.random(in: -0.1...0.1)))
    }
    
    func decide(offer: Double) -> Bool {
        return offer >= self.acceptance_threshold
    }
}
