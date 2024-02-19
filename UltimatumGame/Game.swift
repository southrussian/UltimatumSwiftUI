//
//  Game.swift
//  UltimatumGame
//
//  Created by Danil Peregorodiev on 17.02.2024.
//

import Foundation

public class Game {
    
    var rounds: Int
    var history: [(Int, Double, Bool)]
    var player1: Player
    var player2: Player
    
    init(rounds: Int = 10) {
        self.rounds = rounds
        self.history = []
        self.player1 = Player(name: "Player1")
        self.player2 = Player(name: "Player2")
    }
    
    func playRound() -> (Double, Bool) {
        let offer = self.player1.make_offer()
        let accepted = self.player2.decide(offer: offer)
        self.history.append((self.rounds, offer, accepted))
        
        return (offer, accepted)
    }
    
    func playGame() {
        print("The game has started! Rounds: \(self.rounds)")
        for roundNumber in 1...self.rounds + 1 {
            let (offer, accepted) = self.playRound()
            if accepted {
                print("Round \(roundNumber): Offer \(offer * 100)% from \(self.player1.name) accepted \(self.player2.name).")
            } else {
                print("Round \(roundNumber): Offer \(offer * 100)% from \(self.player1.name) declined \(self.player2.name).")
            }
        }
        print("Game over")
    }
}
