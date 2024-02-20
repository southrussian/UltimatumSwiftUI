//
//  Player.swift
//  UltimatumGame
//
//  Created by Danil Peregorodiev on 17.02.2024.
//

import Foundation

public class Player {
    
    var strategy: Double
    var name: String
    var acceptanceThreshold: Double
    var fitness: Double
    
    init(name: String) {
        self.name = name
        self.strategy = 0.25
        self.acceptanceThreshold = 0.35
        self.fitness = 0.0
    }
    
    func make_offer() -> Double {
        return max(0, min(1, self.strategy))
    }
    
    func decide(offer: Double) -> Bool {
        return offer >= self.acceptanceThreshold
    }
    
    func updateFitness(offer: Double, accepted: Bool) {
        if accepted {
            self.fitness += 1 - offer
        }
    }
    
}
