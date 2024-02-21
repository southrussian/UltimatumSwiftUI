//
//  OptimizationView.swift
//  UltimatumGame
//
//  Created by Danil Peregorodiev on 22.02.2024.
//

import SwiftUI

struct OptimizationView: View {
    @State private var crossoverValue = 0.0
    @State private var mutationValue = 0.0
    
    var body: some View {
        VStack {
            
            Text("Set the mutation rate for genetic algorithm")

            Slider(value: $mutationValue,
                   in: 0...1,
                   minimumValueLabel: Text("0"),
                   maximumValueLabel: Text("1")) {
                Text("Mutation Rate:")
            }
            .padding()
            
            Text("Mutation Rate: \(mutationValue)")
            
            Divider().padding(.vertical)
            
            Text("Set the crossover rate for genetic algorithm")

            Slider(value: $crossoverValue,
                   in: 0...1,
                   minimumValueLabel: Text("0"),
                   maximumValueLabel: Text("1")) {
                Text("Crossover Rate:")
            }
            .padding()
            
            Text("Crossover Rate: \(crossoverValue)")
            

        }
        .padding()
    }
}

#Preview {
    OptimizationView()
}
