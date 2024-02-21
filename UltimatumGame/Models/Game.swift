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
    var player1: Player
    var player2: Player
    @Published var geneticAlgorithm: GeneticAlgorithm
    @Published var nash: Double?
    @Published var nashHistory: [Double?]
    
    init(rounds: Int = 10) {
        self.rounds = rounds
        self.history = []
        self.player1 = Player(name: "Player 1")
        self.player2 = Player(name: "Player 2")
        var players = [Player]()
        for _ in 1...100 {
            let player = Player(name: "Player 1")
            player.strategy = self.player1.strategy + Double.random(in: -0.1...0.1)
            players.append(player)
        }
        self.geneticAlgorithm = GeneticAlgorithm(population: players, mutationRate: 0.75, crossoverRate: 0.75)
        self.nashHistory = []
    }
    
    func playRound() -> (Double, Bool) {
        let offer = self.player1.make_offer()
        let accepted = self.player2.decide(offer: offer)
        self.history.append((self.rounds, offer, accepted))
        self.player1.updateFitness(offer: offer, accepted: accepted)
        return (offer, accepted)
    }
    
//    func clearGame() {
//        self.history.removeAll()
//        self.rounds = 0
//        self.nash = 0
//    }
//    
    func playGame() {
        print("The game has started! Rounds: \(self.rounds)")
        var roundNumber = 0
    
        var dropout = [Player]()
        while roundNumber != self.rounds {
            self.geneticAlgorithm.evolve()
            for individual in self.geneticAlgorithm.population {
                self.player1 = individual
                let (offer, accepted) = self.playRound()
                if accepted {
                    if nash != nil {
                        if player1.strategy < self.nash! {
                            self.nash = player1.strategy
                            self.nashHistory.append(self.nash)
                        }
                    } else {
                        self.nash = player1.strategy
                        self.nashHistory.append(self.nash)
                    }
                    print("Round \(roundNumber + 1): Offer \(offer * 100)% from \(self.player1.name) accepted \(self.player2.name).")
                }  else {
                    dropout.append(individual)
                    print("Round \(roundNumber + 1): Offer \(offer * 100)% from \(self.player1.name) declined \(self.player2.name).")
                }
            }
            self.geneticAlgorithm.population = self.geneticAlgorithm.population.filter {player in !dropout.contains(where: { $0.id == player.id })}
            dropout.removeAll()
            roundNumber += 1
        }
        print("real rounds:", roundNumber)
        print(nashHistory)
        if nash != nil {
            print("Game over, best found nash: [\(nash!), \(1-nash!)]")
        } else {
            print("Game over, nash not found")
        }
    }

}

//import Foundation
//
//public class Game: ObservableObject {
//    
//    @Published var rounds: Int
//    @Published var history: [(Int, Double, Bool)]
//    @Published var player1: Player
//    @Published var player2: Player
//    @Published var message: String
//    
//    init(rounds: Int = 10) {
//        self.rounds = rounds
//        self.history = []
//        self.player1 = Player(name: "Player1")
//        self.player2 = Player(name: "Player2")
//        self.message = ""
//    }
//    
//    func playRound() -> (Double, Bool) {
//        let offer = self.player1.make_offer()
//        let accepted = self.player2.decide(offer: offer)
//        self.history.append((self.rounds, offer, accepted))
//        return (offer, accepted)
//    }
//    
//    func playGame() {
//        print("The game has started! Rounds: \(self.rounds)")
//        for roundNumber in 1...self.rounds {
//            let (offer, accepted) = self.playRound()
//            if accepted {
//                self.message = "Round \(roundNumber): Offer \(offer * 100)% from \(self.player1.name) accepted \(self.player2.name)."
//                print("Round \(roundNumber): Offer \(offer * 100)% from \(self.player1.name) accepted \(self.player2.name).")
//            } else {
//                self.message = "Round \(roundNumber): Offer \(offer * 100)% from \(self.player1.name) declined \(self.player2.name)."
//                print("Round \(roundNumber): Offer \(offer * 100)% from \(self.player1.name) declined \(self.player2.name).")
//            }
//        }
//        print("\nGame over")
//    }
//}
