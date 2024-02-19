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
    
    init(name: String) {
        self.name = name
        self.strategy = 0.5
        self.acceptanceThreshold = 0.5
    }
    
    func make_offer() -> Double {
        return max(0, min(1, self.strategy + Double.random(in: -0.1...0.1)))
    }
    
    func decide(offer: Double) -> Bool {
        return offer >= self.acceptanceThreshold
    }
    
    func updateStrategy(history: [(Int, Double, Bool)]) {
        let acceptedOffers = history.filter { $0.2 }.map { $0.1 }
        
        if acceptedOffers.count < history.count / 2 {
            strategy = min(1, strategy + 0.05)
        } else {
            strategy = max(0, strategy - 0.05)
        }
        
        if !acceptedOffers.isEmpty {
            acceptanceThreshold = (acceptedOffers.reduce(0, +) / Double(acceptedOffers.count))
        } else {
            acceptanceThreshold = max(0, acceptanceThreshold - 0.05)
        }
    }

}
