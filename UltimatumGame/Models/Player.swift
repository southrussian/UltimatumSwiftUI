//
//  Player.swift
//  UltimatumGame
//
//  Created by Danil Peregorodiev on 17.02.2024.
//

import Foundation

public class Player {

    var strategy: Double
    var acceptanceThreshold: Double
    var id: UUID
    
    init(strategy: Double, acceptanceThreshold: Double) {
        self.strategy = strategy
        self.acceptanceThreshold = acceptanceThreshold
        self.id = UUID()
    }
    
    func make_offer() -> Double {
        return max(0, min(1, self.strategy))
    }
    
    func decide(offer: Double) -> Bool {
        return offer >= self.acceptanceThreshold
    }
    
}
