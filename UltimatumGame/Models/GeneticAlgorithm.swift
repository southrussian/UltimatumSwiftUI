//
//  GeneticAlgorithm.swift
//  UltimatumGame
//
//  Created by Danil Peregorodiev on 21.02.2024.
//

import Foundation

public class GeneticAlgorithm {
    
    var population: [Player]
    var mutationRate: Double
    var crossoverRate: Double
    
    init(population: [Player], mutationRate: Double, crossoverRate: Double) {
        self.population = population
        self.mutationRate = mutationRate
        self.crossoverRate = crossoverRate
    }
    
    func selection() -> Player {
        let index = Int.random(in: 0..<population.count)
        return population[index]
    }
    
    func crossover(parent1: Player, parent2: Player) -> Player {
        let child = Player(name: "Child")
        child.strategy = (parent1.strategy + parent2.strategy) / 2
        return child
    }
    
    func mutation(player: Player) {
        if Double.random(in: 0...1) < mutationRate {
            player.strategy += Double.random(in: -0.1...0.1)
        }
    }
    
    func evolve() {
        var newPopulation: [Player] = []
        
        for _ in 0..<population.count {
            
            let parent1 = selection()
            let parent2 = selection()
            
            var child: Player
            if Double.random(in: 0...1) < crossoverRate {
                child = crossover(parent1: parent1, parent2: parent2)
            } else {
                child = [parent1, parent2].randomElement()!
            }
            
            mutation(player: child)
            
            newPopulation.append(child)
        }
        
        population = newPopulation
    }
}
