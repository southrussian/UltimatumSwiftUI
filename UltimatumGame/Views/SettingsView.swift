//
//  SettingsView.swift
//  UltimatumGame
//
//  Created by Danil Peregorodiev on 22.02.2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var menuSelected = 0
    @State private var sliderValue = 10
    
    var body: some View {
        VStack {
            Text("Choose the amount of players")
            
            Picker(selection: $menuSelected, label: Text("Select:")) {
                Text("Two Players").tag(1)
                Text("Three Players").tag(2)
                Text("N Players").tag(3)

            }
            .frame(width: 250)
            
            Divider().padding(.vertical)
            
            Text("Choose the amount of rounds in game")

            Slider(value: .convert(from: $sliderValue),
                   in: 10...200, step: 1, 
                   minimumValueLabel: Text("10"),
                   maximumValueLabel: Text("200")) {
                Text("Rounds:")
            }
            .padding()
            
            Text("\(sliderValue)")
            
            Divider().padding(.vertical)
        }
        .padding()
    }
}


#Preview {
    SettingsView()
}

public extension Binding {

    static func convert<TInt, TFloat>(from intBinding: Binding<TInt>) -> Binding<TFloat>
    where TInt:   BinaryInteger,
          TFloat: BinaryFloatingPoint{

        Binding<TFloat> (
            get: { TFloat(intBinding.wrappedValue) },
            set: { intBinding.wrappedValue = TInt($0) }
        )
    }

    static func convert<TFloat, TInt>(from floatBinding: Binding<TFloat>) -> Binding<TInt>
    where TFloat: BinaryFloatingPoint,
          TInt:   BinaryInteger {

        Binding<TInt> (
            get: { TInt(floatBinding.wrappedValue) },
            set: { floatBinding.wrappedValue = TFloat($0) }
        )
    }
}
