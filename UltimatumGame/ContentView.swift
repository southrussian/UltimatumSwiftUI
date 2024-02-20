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
  @State var current_page: menu = .game_settings
  var game = Game() // Assuming you have a `Game` class

  var body: some View {
    NavigationSplitView {
      List(menu.allCases, selection: $current_page) { row in
        NavigationLink(LocalizedStringKey(row.rawValue), value: row)
      }
    } detail: {
        EmptyView()
//      navigationDestination(for: menu.self) { selectedMenu in
//        switch selectedMenu {
//        case .game_settings:
//          SettingsView()
//        case .ga_settings:
//          OptimizationView()
//        case .simulation:
//          SimulationView()
//        case .history:
//          HistoryView()
//        }
//      }
    }
  }
}

#Preview {
  ContentView()
}
