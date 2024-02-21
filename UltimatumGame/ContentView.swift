//
//  ContentView.swift
//  UltimatumGame
//
//  Created by Danil Peregorodiev on 17.02.2024.
//

import SwiftUI

enum menu: String, Identifiable, CaseIterable {
    case game_settings = "Game Settings"
    case ga_settings = "Optimization"
    case simulation = "Simulation"
    case history = "History"
    var id: UUID { UUID() }
}

struct ContentView: View {
    @State var current_page: menu? = nil
    var game = Game()
    
    var body: some View {
        NavigationSplitView {
            List(menu.allCases, selection: $current_page) { row in
                NavigationLink(LocalizedStringKey(row.rawValue), value: row)
            }
        } detail: {
            switch current_page {
            case .game_settings:
                EmptyView()
            case .ga_settings:
                EmptyView()
            case .simulation:
                SimulationView()
            case .history:
                HistoryView()
            case nil:
                EmptyView()
            }
        }
    }
}

#Preview {
    ContentView()
}
