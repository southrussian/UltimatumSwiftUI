//
//  Game.swift
//  UltimatumGame
//
//  Created by Danil Peregorodiev on 17.02.2024.
//

import Foundation

public class Game: ObservableObject {
    
    @Published var rounds: Int
    @Published var history: [(Int, Double, Bool)]
    @Published var player1: Player
    @Published var player2: Player
    @Published var message: String
    
    init(rounds: Int = 10) {
        self.rounds = rounds
        self.history = []
        self.player1 = Player(name: "Player1")
        self.player2 = Player(name: "Player2")
        self.message = ""
    }
    
    func playRound() -> (Double, Bool) {
        let offer = self.player1.make_offer()
        let accepted = self.player2.decide(offer: offer)
        self.history.append((self.rounds, offer, accepted))
        return (offer, accepted)
    }
    
    func playGame() {
        print("The game has started! Rounds: \(self.rounds)")
        for roundNumber in 1...self.rounds {
            let (offer, accepted) = self.playRound()
            if accepted {
                self.message = "Round \(roundNumber): Offer \(offer * 100)% from \(self.player1.name) accepted \(self.player2.name)."
                print("Round \(roundNumber): Offer \(offer * 100)% from \(self.player1.name) accepted \(self.player2.name).")
            } else {
                self.message = "Round \(roundNumber): Offer \(offer * 100)% from \(self.player1.name) declined \(self.player2.name)."
                print("Round \(roundNumber): Offer \(offer * 100)% from \(self.player1.name) declined \(self.player2.name).")
            }
        }
        print("\nGame over")
        
//        for (roundNumber, (rounds, offer, accepted)) in Game().history.enumerated() {
//            if accepted {
//                print("Раунд \(roundNumber + 1): Соглашение достигнуто на \(roundNumber + 1) ходу.")
//                break
//            }
//        }
    }
}
