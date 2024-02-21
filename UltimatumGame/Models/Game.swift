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
    @Published var nashHistoryStruct: [NashHistory] = []
    
    init(rounds: Int = 50) {
        self.rounds = rounds
        self.history = []
        self.player1 = Player(strategy: 0.9, acceptanceThreshold: 0.35)
        self.player2 = Player(strategy: 0.9, acceptanceThreshold: 0.35)
        var players = [Player]()
        for _ in 1...100 {
            let player = Player(strategy: 0.9, acceptanceThreshold: 0.35)
            player.strategy = self.player1.strategy + Double.random(in: -0.1...0.1)
            players.append(player)
        }
        self.geneticAlgorithm = GeneticAlgorithm(population: players, mutationRate: 0.8, crossoverRate: 0.8)
        self.nashHistory = []
    }
    
    func playRound() -> (Double, Bool) {
        let offer = self.player1.make_offer()
        let accepted = self.player2.decide(offer: offer)
        return (offer, accepted)
    }
    
    func evaluate(round: Int) {
        for individual in self.geneticAlgorithm.population {
            self.player1 = individual
            let (offer, accepted) = self.playRound()
            self.history.append((round, offer, accepted))
        }
    }
    
    func playGame() {
        var roundNumber = 0
        while roundNumber != self.rounds {
            self.geneticAlgorithm.evolve()
            self.evaluate(round: roundNumber)
            let accepted_values = self.history.filter { $0.0 == roundNumber && $0.2 == true }.map { $0.1 }.sorted()
            let rejected_values = self.history.filter { $0.0 == roundNumber && $0.2 == false }.map { $0.1 }.sorted()
            if !accepted_values.isEmpty {
                let propoused_nash = accepted_values.first!
                if self.nash == nil {
                    self.nash = propoused_nash
                    self.nashHistory.append(self.nash)
                } else {
                    if self.nash! > propoused_nash {
                        self.nash = propoused_nash
                        self.nashHistory.append(self.nash)
                    }
                }
            }
            let new_polycies = rejected_values[Int(Double(rejected_values.count) * 0.8)...] + accepted_values[..<Int(Double(accepted_values.count) * 0.8)]
            var new_generation = [Player]()
            for policy in new_polycies {
                new_generation.append(Player(strategy: policy, acceptanceThreshold: 0.35))
            }
            self.geneticAlgorithm.population = new_generation
            roundNumber += 1
        }
        
        processNashHistory(nashHistoryArray: nashHistory)
        print(nashHistoryStruct)
    }
    
    func processNashHistory(nashHistoryArray: [Double?]) {
            for (index, value) in nashHistoryArray.enumerated() {
                let newItem = NashHistory(nashValue: value, index: index)
                nashHistoryStruct.append(newItem)
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
